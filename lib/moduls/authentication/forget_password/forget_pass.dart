// ignore_for_file: use_build_context_synchronously

import 'package:diseases_checker/moduls/authentication/signup/signup.dart';
import 'package:diseases_checker/moduls/home/homepage.dart';
import 'package:diseases_checker/shared/components/components.dart';
import 'package:diseases_checker/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

// ignore: non_constant_identifier_names
String ForgetPasswordPageId = "ForgetPasswordPage";

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool checking = false;
  var emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SizedBox(
            height: hight,
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: hight / 2,
                decoration: BoxDecoration(
                  color: ColorConstants.starterWhite,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const SizedBox(
                      height: 80,
                      child: Image(
                        image: AssetImage("images/LoginLogo.png"),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Enter your email address to reset your password".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: ColorConstants.cardBackGroundColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Julee',
                          fontStyle: FontStyle.normal),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: hight,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SafeArea(
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 15),
                            height: hight / 1.8,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(32)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Email Address'.tr,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Julee",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),

                                // Email address Field
                                defultEmailFormField(
                                  onChanged: (value) {},
                                  controller: emailController,
                                  hintText: "Email address".tr,
                                  suffixIcon: Icons.email_outlined,
                                ),

                                const SizedBox(
                                  height: 20,
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  height: 50,
                                  color: Colors.blue,
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      isLoading = true;
                                      setState(() {});
                                      try {
                                        await _auth.sendPasswordResetEmail(
                                            email: emailController.text.trim());
                                        setState(() {});
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Password reset email sent. Check your inbox.'),
                                          ),
                                        );
                                      } on FirebaseAuthException catch (e) {
                                        setState(() {
                                          switch (e.code) {
                                            case 'invalid-email':
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Invalid email address'),
                                                ),
                                              );
                                              break;
                                            case 'user-not-found':
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content:
                                                      Text('user-not-found'),
                                                ),
                                              );
                                              break;
                                            case 'too-many-requests':
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content:
                                                      Text('too-many-requests'),
                                                ),
                                              );
                                              break;
                                            case 'network-request-failed':
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Network error. Check your internet connection and try again'),
                                                ),
                                              );
                                              break;
                                            default:
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'An error occurred. Please try again later'),
                                                ),
                                              );
                                              break;
                                          }
                                        });
                                      }
                                    }
                                    isLoading = false;
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Reset Password',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don’t have an account?'.tr,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Julee"),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.white.withOpacity(0.2),
                                    highlightColor:
                                        Colors.white.withOpacity(0.2),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup(),
                                          ));
                                    },
                                    child: Text(
                                      "Sign up now".tr,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        fontFamily: "Julee",
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                thickness: 1,
                                height: 1,
                                color: ColorConstants.starterWhite,
                              )),
                              const SizedBox(width: 12),
                              Text('or'.tr,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Julee",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: Divider(
                                thickness: 1,
                                height: 1,
                                color: ColorConstants.starterWhite,
                              )),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.white.withOpacity(0.2),
                              highlightColor: Colors.white.withOpacity(0.2),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ));
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "Continue as a Guest".tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Julee",
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
