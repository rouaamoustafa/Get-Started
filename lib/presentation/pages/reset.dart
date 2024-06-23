import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_started/presentation/pages/login.dart';

import '../recources/route_manager.dart';
import 'fields.dart';

class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
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
                      const LogIn(),
                      AxisDirection.right
                  )
              );
            },
              child:  Icon(Icons.arrow_back,color: Colors.black,size: 30,),
            ),

              const SizedBox(height: 15),
              Text(
                  "Reset Password",
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
                  "Set the new password for account so you can login and access all the features.",
                  style:TextStyle(
                    //fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.withOpacity(0.9),
                      letterSpacing: -0.5,
                      height: 0.95
                  )
              ),
              const SizedBox(height: 20),
              const CustomTextField(labelText: "Password", hintText: "Enter your password"),
              const SizedBox(height: 20),
              const CustomTextField(labelText: "Password", hintText: "Enter your password"),
              const SizedBox(height: 280),
              Center(
                child: GestureDetector(
                  onTap: () {
                    //Navigator.of(context).pushReplacementNamed(Routes.registerPage);
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
