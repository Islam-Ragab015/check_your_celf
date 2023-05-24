import 'package:diseases_checker/moduls/authentication/login/login.dart';
import 'package:diseases_checker/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/backk1.jpg'), fit: BoxFit.fitHeight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: ClipOval(
                  child: SizedBox(
                    width: 180,
                    height: 100,
                    child: Image.asset(
                      "images/heart.gif",
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 660,
              ),
              Container(
                child: defultButton(
                  buttonFunction: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login())),
                  buttonName: "Get Started".tr,
                  isUperCase: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
