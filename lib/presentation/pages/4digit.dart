import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_started/presentation/pages/ForgotPassword.dart';
import 'package:get_started/presentation/pages/reset.dart';

import '../recources/route_manager.dart';
import 'four_text_fields.dart';

class Digits extends StatefulWidget {
  const Digits({Key? key}) : super(key: key);

  @override
  State<Digits> createState() => _DigitsState();
}

class _DigitsState extends State<Digits> {
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.sizeOf(context).height;
    var W = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body:  Center(
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
                        const ForgotPassword_Page(),
                        AxisDirection.right
                    )
                );
              },
              child: const  Icon(Icons.arrow_back,color: Colors.black,size: 30,),
            ),

              const SizedBox(height: 15),
              Text(
                  "Enter 4 Digit Code",
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
                  "Enter 4 digit code that your receive on your email(email).",
                  style:TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.withOpacity(0.9),
                      letterSpacing: -0.5,
                      height: 0.95
                  )
              ),
              const SizedBox(height: 20),
              FourSquareTextFields(),
              const SizedBox(height: 20),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    children: [
                      const TextSpan(
                        text: 'Email not received? ',
                      ),
                      TextSpan(
                        text: 'Resend code',
                        style:  TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.8),
                          //fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigator.push(
                            //     context,
                            //     RouteManager.buildPageRoute(
                            //         const LogIn(),
                            //         AxisDirection.left
                            //     )
                            // );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 350),

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        RouteManager.buildPageRoute(
                            const Reset(),
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
                        Text("Continue ", style: TextStyle(fontSize: 25,color: Colors.white)),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
