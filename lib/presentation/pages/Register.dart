import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_started/presentation/pages/policy.dart';
import 'package:get_started/presentation/pages/reset.dart';

import '../recources/route_manager.dart';
import 'Page1.dart';
import 'fields.dart';
import 'google_logo.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    fullnameController.addListener(_updateButtonState);
    emailController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }
  @override
  void dispose() {
    fullnameController.removeListener(_updateButtonState);
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: W*0.9,
            height: H*0.9,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create an account",
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
                    "Let's create your account.",
                    style:TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.grey.withOpacity(0.9),
                    letterSpacing: -1,
                    height: 0.95
                 )
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  labelText: "Full Name",
                  hintText: "Enter your full name" ,
                  controller:fullnameController
                ),
                const SizedBox(height: 12),
                CustomTextField(
                    labelText: "Email",
                    hintText: "Enter your email address",
                    controller:emailController
                ),
                const SizedBox(height: 12),
                CustomTextField(
                    controller:passwordController,
                    labelText: "Password",
                    hintText: "Enter your password",
                    icon: Icons.remove_red_eye_rounded,
                    isPassword: true,
                ),
                const SizedBox(height: 12),
                RichTextWithLinks(),
                const SizedBox(height: 12),
                Center(
                  child: GestureDetector(
                    onTap: isButtonEnabled
                        ? () async {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text
                      );
                      Navigator.push(
                          context,
                          RouteManager.buildPageRoute(
                              const Page1(),
                              AxisDirection.left
                          )
                      );
                      print("succes register");
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
                          Text("Create an Account", style: TextStyle(fontSize: 25,color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
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
                            "Sign Up with Google",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
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
                            "Sign Up with Facebook",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Already have an account? ',
                        ),
                        TextSpan(
                          text: 'Log in',
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
                                    const LogIn(),
                                    AxisDirection.left
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
