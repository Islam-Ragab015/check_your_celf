import 'package:diseases_checker/moduls/welcome_screen/wealcome_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Image.asset(
                "images/splash.gif",
                height: 150,
                width: 150,
              ),
            )),
            const Text(
              "Developed by RAMIZ CO.",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );

    //             backgroundColor: Color(0xff8BC6CD),
    //             pageTransitionType: PageTransitionType.leftToRight,
    //             splashIconSize: 300,
    //             splashTransition: SplashTransition.rotationTransition,
    //             nextScreen: Welcome(),
    //             splash: const CircleAvatar(
    //               radius: 140,
    //               backgroundImage: AssetImage("images/splash.gif"),
    //             ),
    //           );
    // }
  }
}
