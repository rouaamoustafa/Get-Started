import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_started/presentation/pages/ForgotPassword.dart';
import 'package:get_started/presentation/pages/Register.dart';

import '../../app/test2.dart';
import '../recources/route_manager.dart';
import 'fields.dart';
import 'google_logo.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    emailController.removeListener(_updateButtonState);
    passwordController.removeListener(_updateButtonState);
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.sizeOf(context).height;
    var W = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Center(
          child: Container(
            width: W*0.9,
            height: H*0.9,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Text(
                    "Login to your account",
                    style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black.withOpacity(0.9),
                        letterSpacing: -2,
                        height: 0.95
                    )
                ),
                const SizedBox(height: 5),
                Text(
                    "It's great to see you again.",
                    style:TextStyle(
                      //fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey.withOpacity(0.9),
                        letterSpacing: -0.5,
                        height: 0.95
                    )
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    controller:emailController ,
                    labelText: "Email",
                    hintText: "Enter your email"),
                const SizedBox(height: 15),
                CustomTextField(
                    controller: passwordController,
                    labelText: "Password",
                    hintText: "Enter your password",
                    isPassword: true,
                ),
                const SizedBox(height: 15),
                RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Forgot your password?',
                          style: TextStyle(letterSpacing: -0.5,)
                        ),
                        TextSpan(
                          text: 'Reset your password',
                          style:  TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.8),
                            letterSpacing: -0.5,
                            //fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  RouteManager.buildPageRoute(
                                      const ForgotPassword_Page(),
                                      AxisDirection.left
                                  )
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap:
                    isButtonEnabled
                        ? () async {
                      // Perform login action here
                      // For example, using Firebase authentication
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        // Navigate to Page1 after successful login
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Page1()),
                        );
                      } catch (error) {
                        // Handle login errors here
                        print("Error logging in: $error");
                      }
                    }
                        : null,
                    child: Container(
                      width: W*0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: isButtonEnabled
                            ? Colors.blue
                            : Colors.grey.withOpacity(0.4),
                      ) ,
                      child:
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Login", style: TextStyle(fontSize: 25,color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or",
                        style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Add your onTap logic here
                    },
                    child: Container(
                      width: W * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1), // Add border here
                      ),
                      child:const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GoogleLogo(size: 25),
                          SizedBox(width: 10),
                          Text(
                            "Log in with Google",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Add your onTap logic here
                    },
                    child: Container(
                      width: W * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue,
                        // border: Border.all(color: Colors.black, width: 1), // Add border here
                      ),
                      child:const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.facebook,
                            color: Colors.white,
                            size: 35,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Log in with Facebook",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 95),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                      children: [
                        const TextSpan(
                          text:  " Don't have an account ?",
                        ),
                        TextSpan(
                          text: 'Join',
                          style:  TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.8),
                            //fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  RouteManager.buildPageRoute(
                                      const RegisterPage(),
                                      AxisDirection.right
                                  )
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
