import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_started/firebase_options.dart';
import 'package:get_started/presentation/pages/splash_page..dart';
import 'package:get_started/presentation/recources/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: RouteManager.getRoute,
      initialRoute: Routes.splashPage,
      home: SplashPage(),
    );
  }
}
