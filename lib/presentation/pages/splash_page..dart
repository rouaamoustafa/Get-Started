import 'dart:async';


import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../recources/route_manager.dart';
import '../recources/strings_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 5), _goNext);
  }

  _goNext() {
    Navigator.of(context).pushReplacementNamed(Routes.homePage);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Positioned.fill(
                top:60,
                // width: 100,
                // height: 100,
                child:Image.asset("assets/pic3(1)(1).png",fit: BoxFit.cover)
            ),
            Positioned.fill(

                top:60,
                // width: 100,
                // height: 100,
                child:Image.asset("assets/pic2.png",fit: BoxFit.cover)

            ),
            Positioned(
                left:160,
                bottom:20,
                width: 100,
                height: 100,
                child:
                LoadingAnimationWidget.discreteCircle(
                  color:Colors.white38,
                  size: 50,
                  secondRingColor: Colors.white12,
                  thirdRingColor: Colors.black45,
                )
            ),
          ],
        )
    );
  }
}