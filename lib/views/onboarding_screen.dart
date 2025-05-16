import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/views/onboarding-screens/page1.dart';
import 'package:news_app/views/onboarding-screens/page2.dart';
import 'package:news_app/views/onboarding-screens/page4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding-screens/page3.dart';
class OnboardingScreen extends StatefulWidget {

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff000000),
                  Color(0xff23ABC3),
                  Color(0xffFFFFFF)
                ]
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView(
                    controller: _controller,
                    children: [
                      Onboarding1(),
                      Onboarding2(),
                      Onboarding3(),
                      Onboarding4(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SmoothPageIndicator(controller: _controller, count: 4),
                )
              ],
            ),

        ),
      ),
    );
  }
}
