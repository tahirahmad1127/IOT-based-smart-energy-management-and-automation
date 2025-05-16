import 'package:flutter/material.dart';
import 'package:news_app/services/auth.dart';
import 'package:news_app/views/Home.dart';
import 'package:news_app/views/register.dart';
import 'package:news_app/views/reset_pwd.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff000000), Color(0xff23ABC3), Color(0xffFFFFFF)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Color(0xFF00d4ff),
                      shape: BoxShape.circle,
                    ),
                    child:
                    const Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 24),
                  const Text('Log in!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Take charge.',
                      style: TextStyle(color: Colors.white70, fontSize: 18)),
                  const SizedBox(height: 48),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: pwdController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon:
                      const Icon(Icons.lock_outline, color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () async {
                        if (emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Email cannot be empty")));
                          return;
                        }
                        if (pwdController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                  Text("Password cannot be empty")));
                          return;
                        }

                        try {
                          setState(() => _isLoading = true);

                          await AuthServices()
                              .loginUser(
                              email: emailController.text,
                              password: pwdController.text)
                              .then((val) {
                            setState(() => _isLoading = false);

                            if (val != null) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.cyan,
                                    title: const Text(
                                        style: TextStyle(
                                          color: Colors.black
                                        ),
                                        "Logged In"),
                                    content:
                                    const Text(
                                        style: TextStyle(
                                            color: Colors.black
                                        ),
                                        "Welcome to Voltfy"),
                                    actions: [

                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Exit")),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeScreen()),
                                              ),
                                          child: const Text("Continue")),
                                    ],
                                  ));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => const AlertDialog(
                                    backgroundColor: Colors.cyan,
                                    title: Text(
                                        style: TextStyle(
                                          color: Colors.black
                                        ),
                                        "Login Error"),
                                    content: Text(
                                        style: TextStyle(
                                            color: Colors.black
                                        ),
                                        "Make Sure you are using the correct Credentials and your Email is Verified"),
                                  ));
                            }
                          });
                        } catch (e) {
                          setState(() => _isLoading = false);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('Sign In',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ResetPasswordView()));
                    },
                    child: const Text('Forgot password?',
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ",
                          style: TextStyle(color: Colors.black)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignupScreen()));
                        },
                        child: const Text('Sign Up',
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}