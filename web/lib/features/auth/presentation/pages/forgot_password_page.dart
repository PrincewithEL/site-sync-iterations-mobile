import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:site_sync/features/auth/presentation/pages/verify_otp_page.dart';
import 'package:site_sync/features/dashboard/presentation/pages/dashboard_page.dart';

import '../../../../core/common/widgets/auth_field.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/google_signin_button.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/services/google_services/google_signin.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/contextual_components.dart';

class ForgotPasswordPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ForgotPasswordPage());

  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: AppPallete.errorColor,
            ),
            child: const Text(
              "Reset Password",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is ResetPasswordLoading) {
                    const Loader();
                  }

                  if (state is ResetPasswordFailure) {
                    showSnackBar(context, state.message);
                  }

                  if (state is ResetPasswordSuccess) {
                    showSnackBarWithButton(
                      context,
                      content: state.response,
                      label: "Verify",
                      onPressed: () => Navigator.push(
                        context,
                        VerifyOtpPage.route(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Reset Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Use your register email address to request for password reset.",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AuthField(
                            hintText: "Email Address",
                            controller: _emailOrPhoneController),
                        const SizedBox(
                          height: 15,
                        ),
                        AuthGradientButton(
                          buttonText: "Reset Password",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    AuthResetPassword(
                                      emailAddress:
                                          _emailOrPhoneController.text.trim(),
                                    ),
                                  );
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
