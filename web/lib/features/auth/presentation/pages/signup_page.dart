import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:site_sync/core/common/widgets/loader.dart';
import 'package:site_sync/core/utils/contextual_components.dart';
import 'package:site_sync/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:site_sync/features/auth/presentation/pages/signup_profile_page.dart';
import 'package:site_sync/features/dashboard/presentation/pages/dashboard_page.dart';

import '../../../../core/common/widgets/auth_field.dart';
import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/google_signin_button.dart';
import '../../../../core/services/google_services/google_signin.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

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
              Navigator.pushReplacement(context, SignUpProfilePage.route());
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Create Account.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    AuthField(
                      hintText: "Full Name",
                      controller: _fullNameController,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    AuthField(
                      hintText: "Email",
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    AuthField(
                      hintText: "Phone Number",
                      controller: _phoneNumberController,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    AuthPasswordField(
                      hintText: "Password",
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    AuthPasswordField(
                      hintText: "Confirm Password",
                      obscureText: true,
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm password is required!";
                        } else if (_passwordController.text.trim() != value) {
                          return "Password doesn't match";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AuthGradientButton(
                      buttonText: "Sign Up",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignUp(
                                  fullName: _fullNameController.text.trim(),
                                  emailAddress: _emailController.text.trim(),
                                  phoneNumber:
                                      _phoneNumberController.text.trim(),
                                  password: _passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GoogleSignInButton(
                      buttonText: "Sign up with Google",
                      onPressed: () async {
                        await GoogleAuthSignIn().signInWithGoogle().then(
                              (value) => Navigator.push(
                                context,
                                MainDashboardPage.route(),
                              ),
                            );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
