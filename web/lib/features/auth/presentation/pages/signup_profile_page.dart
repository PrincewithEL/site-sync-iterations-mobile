import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:site_sync/core/common/widgets/loader.dart';
import 'package:site_sync/core/images/app_images.dart';
import 'package:site_sync/core/theme/app_pallete.dart';
import 'package:site_sync/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:site_sync/features/dashboard/presentation/pages/dashboard_page.dart';

import '../../../../core/common/widgets/auth_gradient_button.dart';
import '../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../core/utils/contextual_components.dart';

class SignUpProfilePage extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SignUpProfilePage());

  const SignUpProfilePage({super.key});

  @override
  State<SignUpProfilePage> createState() => _SignUpProfilePageState();
}

class _SignUpProfilePageState extends State<SignUpProfilePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.errorColor,
        automaticallyImplyLeading: true,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is CompleteProfileLoading) {
            const Loader();
          }

          if (state is CompleteProfileFailure) {
            showSnackBar(context, state.message);
          }

          if (state is CompleteProfileSuccess) {
            Navigator.pushReplacement(context, MainDashboardPage.route());
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      30,
                    ),
                    bottomRight: Radius.circular(
                      30,
                    ),
                  ),
                  color: AppPallete.errorColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Create Account.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      "Select a profile picture",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppPallete.whiteColor,
                          width: 1,
                        ),
                        color: AppPallete.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: SvgPicture.asset(AppImages.onBoarding1)),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    CustomDropdown(
                      items: const [
                        'Client',
                        'Contractor',
                      ],
                      hint: 'Select a user type',
                      onChanged: (String? value) {},
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    AuthGradientButton(
                      buttonText: "Sign Up",
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthCompleteSignUp(
                                userType: "Contractor",
                                profilePicture: "profilePicture",
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
