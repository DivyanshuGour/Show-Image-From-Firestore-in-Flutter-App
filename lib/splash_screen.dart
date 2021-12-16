import 'package:compass/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    initialise();
    super.initState();
  }

  Future<void> initialise() async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const Home(),
      duration: 10400,
      imageSize: 500,
      imageSrc: "assets/splash.gif",
      backgroundColor: const Color(0xffE6F8FF),
    );
  }
}
