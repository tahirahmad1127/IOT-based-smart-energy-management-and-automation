import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

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
            Color(0xffFFFFFF),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Terms & Conditions',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,

              ),
            ),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white70),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '''
Welcome to Voltify!

By using our app, you agree to the following terms:

1. **Usage:** Voltify is for personal use only. You agree not to misuse the app or its services.

2. **Account Security:** Keep your login credentials secure. We are not responsible for unauthorised account access.

3. **Data Collection:** We collect basic usage data to improve our services. Your privacy is important to us.

4. **Modifications:** We may update these terms anytime. Continued use means you accept any changes.

5. **Limitation of Liability:** Voltify is not liable for any damages caused by the use or inability to use the app.

6. **Governing Law:** These terms are governed by local laws in your region.

If you do not agree with any part of these terms, please discontinue the use of the app.

Thank you for choosing Voltify!
            ''',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,

                color: Colors.black87,
                height: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
