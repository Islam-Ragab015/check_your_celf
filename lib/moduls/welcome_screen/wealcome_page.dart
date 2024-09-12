import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:diseases_checker/moduls/authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 30.0,
      fontFamily: 'Horizon',
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(6),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/doctor.png',
                  height: 150,
                ),
                const SizedBox(height: 20),
                // Text(
                //   'Welcome'.tr,
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 30,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),

                SizedBox(
                  width: 250.0,
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Welcome',
                        textAlign: TextAlign.center,
                        textStyle: colorizeTextStyle,
                        colors: colorizeColors,
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),

                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'It is a free check-up for adults, designed to spot early signs of some diseases like (stroke, kidney disease, heart disease, diabetes,... etc).The check involves a series of health assessments and lifestyle advice to help you to reduce your risk of these conditions about your lifestyle.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontSize: 18, height: 1.44),
                  ),
                ),
                const SizedBox(height: 50),
                // MaterialButton(
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const Login(),
                //         ));
                //   },
                //   color: Colors.white,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(30),
                //   ),
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                //   child: Text(
                //     'Get Started'.tr,
                //     style: TextStyle(
                //       color: Colors.blue[900],
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Get Started'.tr,
                          textStyle: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                    },
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
