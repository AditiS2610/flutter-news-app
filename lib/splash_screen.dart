import 'package:aditi_news/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    // Taking the Screen Constraints
    var size = MediaQuery.of(context).size;
// to execute piece of code after certain delay
    Future.delayed(const Duration(seconds: 3), () {
// Navigating to other screen(closing the previous screen)
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeView(),
          ),
          (route) => false);
    });

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/Splash Icon.png",
              width: size.width * 0.7,
            ),
            const Spacer(),
            const Text(
              "A product by Aditi Developers",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            const SpinKitThreeBounce(
              color: Colors.black,
              size: 30,
            ),
            SizedBox(
              height: size.height * 0.1,
            )
          ],
        ));
  }
}
