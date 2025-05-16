import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Get Notified. Stay Efficient.", style: GoogleFonts.poppins(
                    textStyle: TextStyle(fontWeight:
                    FontWeight.w700, fontSize: 30, color: Colors.black))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
