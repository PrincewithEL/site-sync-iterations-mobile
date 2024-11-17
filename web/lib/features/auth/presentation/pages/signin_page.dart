import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:site_sync/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:site_sync/features/dashboard/presentation/pages/dashboard_page.dart';

import '../../../../core/common/widgets/auth_field.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/google_signin_button.dart';
import '../../../../core/common/widgets/loader.dart';
import '../../../../core/services/google_services/google_signin.dart';
import '../../../../core/utils/contextual_components.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignInPage());

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailOrPhoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoading) {
              const Loader();
            }

            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            }

            if (state is AuthSuccess) {
              showSnackBar(context, state.response);
              Navigator.push(
                context,
                MainDashboardPage.route(),
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
                    "Sign In.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthField(
                      hintText: "Email/Phone Number",
                      controller: _emailOrPhoneController),
                  const SizedBox(
                    height: 5,
                  ),
                  AuthPasswordField(
                    hintText: "Password",
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password is required!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AuthGradientButton(
                    buttonText: "Sign In",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignIn(
                                emailAddress:
                                    _emailOrPhoneController.text.trim(),
                                password: _passwordController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Forgot your password? ",
                      children: [
                        TextSpan(
                          text: 'Click To Reset!',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                ForgotPasswordPage.route(),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GoogleSignInButton(
                    buttonText: "Sign in with Google",
                    onPressed: () async {
                      await GoogleAuthSignIn().signInWithGoogle().then(
                            (value) => Navigator.push(
                              context,
                              MainDashboardPage.route(),
                            ),
                          );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
