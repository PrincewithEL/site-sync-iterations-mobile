import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:site_sync/features/dashboard/presentation/pages/dashboard_page.dart';

import '../../../../core/common/widgets/auth_field.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/google_signin_button.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/services/google_services/google_signin.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/utils/contextual_components.dart';

class VerifyOtpPage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const VerifyOtpPage());

  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

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
              "Verify OTP",
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
                  if (state is VerifyOTPLoading) {
                    const Loader();
                  }

                  if (state is VerifyOTPFailure) {
                    showSnackBar(context, state.message);
                  }

                  if (state is VerifyOTPSuccess) {
                    showSnackBar(context, state.response);
                  }
                },
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Verify OTP",
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
                          "Enter OTP code sent to your email address.",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        AuthField(
                            hintText: "OTP Code",
                            controller: _otpController),
                        const SizedBox(
                          height: 15,
                        ),
                        AuthGradientButton(
                          buttonText: "Verify",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    VerifyOTP(
                                      otpCode:
                                      _otpController.text.trim(),
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
