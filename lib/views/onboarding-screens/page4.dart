import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/views/login.dart';
import 'package:news_app/views/register.dart';
import 'package:news_app/views/terms_and_conditions.dart';
class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

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
            child: Padding(
              padding: const EdgeInsets.only(top: 148),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/logo.png", width: 250, height: 167,),
                        Text("Welcome to Voltify", style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight:
                            FontWeight.w900, fontSize: 30, color: Colors.black87))),
                
                        SizedBox(height: 50,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 50),
                              backgroundColor: Colors.black,
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()), // replace with your screen
                              );
                            }, child: Text("Login", style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white
                            ) ),)),
                        SizedBox(height: 20,),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 50),
                
                              backgroundColor: Colors.white,
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignupScreen()), // replace with your screen
                              );
                            }, child: Text("signup", style: GoogleFonts.poppins(
                            textStyle:TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black
                            ) ),)),
                       SizedBox( height: 140,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("To  read our Terms & Conditons Tap", style: GoogleFonts.poppins(
                                textStyle: TextStyle(fontWeight:
                                FontWeight.w300, fontSize: 8, color: Colors.black))),
                            SizedBox(width: 3,),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditions()));
                            }, child: Text("Here" , style:
                            GoogleFonts.poppins
                              (
                                textStyle: TextStyle(fontWeight:
                                FontWeight.w700, fontSize: 9, color: Colors.black)))),
                          ],
                        ),
                        Text("By Sign Up Or Login you have agreed to our Terms & Conditions", style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontWeight:
                              FontWeight.w300, fontSize: 8, color: Colors.black))),
                      ],
                    ),
              ),
            ),


          ),
        ),
      ),
    );
  }
}
