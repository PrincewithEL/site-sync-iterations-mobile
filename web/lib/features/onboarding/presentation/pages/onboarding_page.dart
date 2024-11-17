import 'dart:async';

import 'package:flutter/material.dart';
import 'package:site_sync/core/images/app_images.dart';
import 'package:site_sync/features/auth/presentation/pages/auth.dart';
import 'package:site_sync/features/onboarding/presentation/pages/onboarding_content.dart';

import '../../../../core/common/widgets/main_app_button.dart';
import '../widgets/dot_indicator.dart';

class OnBoard {
  final String image, description;

  OnBoard({
    required this.image,
    required this.description,
  });
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  final List<OnBoard> onboardingData = [
    OnBoard(
      image: AppImages.onBoarding1,
      description: "Building better by working together.",
    ),
    OnBoard(
      image: AppImages.onBoarding2,
      description: "Building better by working together.",
    ),
    OnBoard(
      image: AppImages.onBoarding3,
      description: "Building better by working together.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageIndex < onboardingData.length - 1) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(image),
            Expanded(
              flex: 2,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: onboardingData.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnBoardContent(
                  description: onboardingData[index].description,
                  image: onboardingData[index].image,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    onboardingData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("By proceeding you agree to our Privacy Policy"),
                    const SizedBox(
                      height: 15,
                    ),
                    MainAppButton(
                      buttonText: "Get Started",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MainAuth.route(),
                        );
                      },
                    ),
                  ],
                )),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
