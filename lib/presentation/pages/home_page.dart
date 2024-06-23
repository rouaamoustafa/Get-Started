
import 'package:flutter/material.dart';
import 'package:get_started/presentation/pages/Register.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../recources/route_manager.dart';
import 'Page1.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var H = MediaQuery.sizeOf(context).height;
    var W = MediaQuery.sizeOf(context).width;


    return Scaffold(
        body:Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: H*0.82,
                  width: W*1,
                  color: Colors.white,
                ),
                 Positioned(
                    left:20,
                    top:30,
                    width: 350,
                    height: 350,
                    child:Text(
                      "Define yourself in your unique way.",
                       style:TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 70,
                         color: Colors.black.withOpacity(0.9),
                         letterSpacing: -2,
                         height: 0.95
                       )
                    )
                ),
                Positioned.fill(
                   // left:20,
                    top:220,
                    // width: W*1,
                    // height: 350,
                    child:Image.asset("assets/pic1_crop.png",fit: BoxFit.cover)
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              // endIndent: 0,
              color: Colors.grey,
            ),
            const SizedBox(height: 20,),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      RouteManager.buildPageRoute(
                          const Page1(),
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
                        Text("Get Started ", style: TextStyle(fontSize: 25,color: Colors.white)),
                        Icon(Icons.arrow_forward, color: Colors.white,)
                      ],
                    ),
                  ),
              ),
              ),
          ],
        ),

    );
  }
}
