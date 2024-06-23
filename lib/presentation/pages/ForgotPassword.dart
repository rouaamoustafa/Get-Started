import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_started/presentation/pages/4digit.dart';

import '../recources/route_manager.dart';
import 'fields.dart';
import 'login.dart';

class ForgotPassword_Page extends StatefulWidget {
  const ForgotPassword_Page({Key? key}) : super(key: key);

  @override
  State<ForgotPassword_Page> createState() => _ForgotPassword_PageState();
}

class _ForgotPassword_PageState extends State<ForgotPassword_Page> {
  final TextEditingController resetemailController = TextEditingController();

  @override
  void dispose(){
    resetemailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
   try{
     print("in password reset");
     await FirebaseAuth.instance.sendPasswordResetEmail(email: resetemailController.text.trim());
     //Utils.showSnackBar("Password Reset Email Sent");
     print("reset password done");
     print(resetemailController.text);
   } on FirebaseAuthException catch (e){
     print(e);

   }
  }

  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.sizeOf(context).height;
    var W = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body:  SingleChildScrollView(
        child: Center(
          child: Container(
            width: W*0.9,
            height: H*0.9,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [GestureDetector(
                onTap:   () {
                  Navigator.push(
                      context,
                      RouteManager.buildPageRoute(
                          const LogIn(),
                          AxisDirection.right
                      )
                  );
                },
                child: const  Icon(Icons.arrow_back,color: Colors.black,size: 30,),
              ),
        
                const SizedBox(height: 15),
                Text(
                    "Forgot Password",
                    style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black.withOpacity(0.9),
                        letterSpacing: -2,
                        height: 0.95
                    )
                ),
                const SizedBox(height: 15),
                Text(
                    "Enter your email for the verification process. We will send 4 digits code to your email.",
                    style:TextStyle(
                      //fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey.withOpacity(0.9),
                        letterSpacing: -0.5,
                        height: 0.95
                    )
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    labelText: "Email",
                    hintText: "Enter your Email",
                  controller: resetemailController,
        
                ),
                const SizedBox( height: 380),
                Center(
                  child: GestureDetector(
                    onTap: () async{

                      await passwordReset();
                      print("finish password reset");
                      Navigator.push(
                          context,
                          RouteManager.buildPageRoute(
                              const Digits(),
                              AxisDirection.left
                          )
                      );
                    },
                    child: Container(
                      width: W*0.9,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ) ,
                      child:
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Send Code ", style: TextStyle(fontSize: 25,color: Colors.white)),
        
                        ],
                      ),
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
