import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
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
    return Container(
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
                  child: SmoothPageIndicator(
                    effect: ScrollingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.black26
                    ),
                      controller: _controller, count: 4),
                )
              ],
            ),

        ),
      );
  }
}
