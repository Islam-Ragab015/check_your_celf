// ignore_for_file: prefer_typing_uninitialized_variables, unused_field, unused_local_variable, use_build_context_synchronously

import 'package:diseases_checker/moduls/authentication/forget_password/forget_pass.dart';
import 'package:diseases_checker/moduls/authentication/signup/signup.dart';
import 'package:diseases_checker/moduls/home/homepage.dart';
import 'package:diseases_checker/shared/components/components.dart';
import 'package:diseases_checker/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

String loginId = "login";

class _LoginState extends State<Login> {
  bool checking = false;
  @override
  void initState() {
    super.initState();
    _isObsecured = true;
  }

  var emailController = TextEditingController();
  var passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _isObsecured;
  String _password = "";
  String _email = "";
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
                      height: 10,
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
                      "Welcome back you've been missed!".tr,
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
                            height: hight / 1.53,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(32)),
                            child: AutofillGroup(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Login Account'.tr,
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
                                    onChanged: (emailValue) {
                                      _email = emailValue;
                                    },
                                    controller: emailController,
                                    hintText: "Email address".tr,
                                    suffixIcon: Icons.email_outlined,
                                  ),

                                  const SizedBox(
                                    height: 16,
                                  ),

                                  // password Field
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),
                                    ),
                                    child: TextFormField(
                                        onChanged: (passwordValue) {
                                          _password = passwordValue;
                                        },
                                        controller: passController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return ("password can't be empty"
                                                .tr);
                                          }

                                          return null;
                                        },
                                        textAlign: TextAlign.center,
                                        autofillHints: const [
                                          AutofillHints.password
                                        ],
                                        onEditingComplete: () =>
                                            TextInput.finishAutofillContext(),
                                        obscureText: _isObsecured,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(26),
                                              borderSide: BorderSide(
                                                  color: ColorConstants
                                                      .starterWhite)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(26)),
                                          ),
                                          labelStyle: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                          suffixIcon: IconButton(
                                            icon: _isObsecured
                                                ? const Icon(
                                                    Icons.visibility,
                                                    color: Colors.black,
                                                  )
                                                : const Icon(
                                                    Icons.visibility_off,
                                                    color: Colors.black),
                                            onPressed: () => setState(() {
                                              _isObsecured = !_isObsecured;
                                            }),
                                          ),
                                          filled: true,
                                          hintText: "Password".tr,
                                          hintStyle: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontFamily: "Julee",
                                          ),
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                          ),
                                        )),
                                  ),

                                  // remember me checkBox
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        value: checking,
                                        onChanged: (value) => setState(() {
                                          checking = value!;
                                        }),
                                      ),
                                      Text("Remember me".tr,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Julee",
                                          )),
                                    ],
                                  ),

                                  // Login button
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(31)),
                                    height: 40,
                                    color: ColorConstants.primaryColor,
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        isLoading = true;
                                        setState(() {});
                                        try {
                                          UserCredential credential =
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                      email: _email,
                                                      password: _password);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePage(),
                                              ));
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'user-not-found') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'No user found for that email.')));
                                          } else if (e.code ==
                                              'wrong-password') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Wrong password provided for that user.')));
                                          } else if (e.code ==
                                              'invalid-email') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'The email address is invalid.')));
                                          } else if (e.code ==
                                              'operation-not-allowed') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Email/password accounts are not enabled.')));
                                          }
                                        }
                                        isLoading = false;
                                        setState(() {});
                                      }
                                    },
                                    child: Text(
                                      'LOG IN'.tr,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
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
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: "Julee",
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ClipRRect(
                                        child: Material(
                                          color: Colors.green,
                                          child: InkWell(
                                            splashColor:
                                                Colors.green.withOpacity(0.2),
                                            highlightColor:
                                                Colors.green.withOpacity(0.2),
                                            onTap: () async {
                                              isLoading = true;
                                              setState(() {});
                                              try {
                                                final GoogleSignInAccount?
                                                    googleUser =
                                                    await GoogleSignIn()
                                                        .signIn();
                                                final GoogleSignInAuthentication
                                                    googleAuth =
                                                    await googleUser!
                                                        .authentication;
                                                final AuthCredential
                                                    credential =
                                                    GoogleAuthProvider
                                                        .credential(
                                                  accessToken:
                                                      googleAuth.accessToken,
                                                  idToken: googleAuth.idToken,
                                                );
                                                final UserCredential
                                                    userCredential =
                                                    await FirebaseAuth.instance
                                                        .signInWithCredential(
                                                            credential);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePage(),
                                                    ));
                                              } on FirebaseAuthException catch (e) {
                                                if (e.code ==
                                                    'sign_in_canceled') {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              'Sign-in process has been canceled.')));
                                                  if (e.code ==
                                                      'sign_in_canceled') {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'Sign-in process has been canceled.')));
                                                  } else if (e.code ==
                                                      'account-exists-with-different-credential') {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'The account already exists with a different credential.')));
                                                  } else if (e.code ==
                                                      'invalid-credential') {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    'The provided credential is not valid.')));
                                                  }
                                                }
                                              }
                                              isLoading = false;
                                              setState(() {});
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              decoration: BoxDecoration(
                                                  // color: Colors.green[200],
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.green)),
                                              child: Image.asset(
                                                "images/google.png",
                                                height: 40,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // ClipRRect(
                                      //   child: Material(
                                      //     color: Colors.green,
                                      //     child: InkWell(
                                      //       splashColor:
                                      //           Colors.green.withOpacity(0.2),
                                      //       highlightColor:
                                      //           Colors.green.withOpacity(0.2),
                                      //       onTap: () {
                                      //         Navigator.push(
                                      //             context,
                                      //             MaterialPageRoute(
                                      //               builder: (context) =>
                                      //                   const HomePage(),
                                      //             ));
                                      //       },
                                      //       child: Container(
                                      //         padding: const EdgeInsets.symmetric(
                                      //             horizontal: 20),
                                      //         decoration: BoxDecoration(
                                      //             // color: Colors.green[200],
                                      //             borderRadius:
                                      //                 BorderRadius.circular(20),
                                      //             border: Border.all(
                                      //                 color: Colors.green)),
                                      //         child: Image.asset(
                                      //           "images/facebook.png",
                                      //           height: 40,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor:
                                            Colors.white.withOpacity(0.2),
                                        highlightColor:
                                            Colors.white.withOpacity(0.2),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ForgetPasswordPage(),
                                              ));
                                        },
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Text(
                                            "Forget Password?".tr,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Julee",
                                              fontWeight: FontWeight.bold,
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
