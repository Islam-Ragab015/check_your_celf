// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, use_build_context_synchronously, unused_local_variable

import 'package:diseases_checker/moduls/authentication/login/login.dart';
import 'package:diseases_checker/moduls/home/homepage.dart';
import 'package:diseases_checker/shared/components/components.dart';
import 'package:diseases_checker/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

String signUpId = "signup";

class _SignupState extends State<Signup> {
  @override
  void initState() {
    super.initState();
    _isObsecuredd = true;
  }

  String? _selectedUserType;

  final formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var Selectedgovernorate;
  var _isObsecuredd;
  var SelectedPreson;
  String _email = "";
  String _password = "";
  String? isADoctorOrAPatient;
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
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: hight / 2,
                  decoration: BoxDecoration(
                      color: ColorConstants.starterWhite,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Welcome! I hope you are fine".tr,
                        style: TextStyle(
                            fontSize: 18,
                            color: ColorConstants.cardBackGroundColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Julee',
                            fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                      height: hight,
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: hight / 1.4,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(32)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Sign Up'.tr,
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
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        DropdownButtonFormField<String>(
                                          decoration: const InputDecoration(
                                            labelText: 'Select user type',
                                            border: OutlineInputBorder(),
                                          ),
                                          value: _selectedUserType,
                                          items: <String>['Doctor', 'Patient']
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? value) {
                                            setState(() {
                                              _selectedUserType = value;
                                            });
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please select a user type';
                                            }
                                            return null;
                                          },
                                        ),
                                      ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  defultEmailFormField(
                                    onChanged: (emailValue) {
                                      _email = emailValue;
                                    },
                                    controller: emailController,
                                    hintText: "Email address".tr,
                                    suffixIcon: Icons.email_outlined,
                                  ),
                                  const SizedBox(height: 10),

                                  // password Field
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),
                                    ),
                                    child: TextFormField(
                                        onChanged: (passwordValue) {
                                          _password = passwordValue;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return ("password cant't be empty!"
                                                .tr);
                                          }

                                          return null;
                                        },
                                        textAlign: TextAlign.center,
                                        obscureText: _isObsecuredd,
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
                                            icon: _isObsecuredd
                                                ? const Icon(
                                                    Icons.visibility,
                                                    color: Colors.black,
                                                  )
                                                : const Icon(
                                                    Icons.visibility_off,
                                                    color: Colors.black),
                                            onPressed: () => setState(() {
                                              _isObsecuredd = !_isObsecuredd;
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
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),
                                    ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.length < 11) {
                                          return ("please enter your real number"
                                              .tr);
                                        }
                                        return null;
                                      },
                                      textAlign: TextAlign.center,
                                      maxLength: 11,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(26),
                                            borderSide: BorderSide(
                                                color: ColorConstants
                                                    .starterWhite)),
                                        focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(26)),
                                        ),
                                        // filled: true,
                                        prefixIcon: const Icon(Icons.phone),
                                        hintText: "Phone".tr,
                                        hintStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontFamily: "Julee",
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Next button
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(31)),
                                    height: 40,
                                    color: ColorConstants.primaryColor,
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        isLoading = true;
                                        setState(() {});
                                        try {
                                          UserCredential credential =
                                              await FirebaseAuth.instance
                                                  .createUserWithEmailAndPassword(
                                            email: _email,
                                            password: _password,
                                          );
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePage(),
                                              ));
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'weak-password') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content:
                                                        Text("weak-password")));
                                          } else if (e.code ==
                                              'email-already-in-use') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'The account already exists for that email.')));
                                          } else if (e.code ==
                                              'operation-not-allowed') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'The email address is invalid.')));
                                          } else if (e.code ==
                                              'invalid-email') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'The email address is invalid.')));
                                          }
                                        }
                                        isLoading = false;
                                        setState(() {});
                                      }
                                    },
                                    child: Text(
                                      'Sign up'.tr,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
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
                                    height: 15,
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
                                      //         padding:
                                      //             const EdgeInsets.symmetric(
                                      //                 horizontal: 20),
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
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?'.tr,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Julee"),
                                  ),
                                  const SizedBox(
                                    width: 12,
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
                                                    const Login(),
                                              ));
                                        },
                                        child: Text(
                                          "Login now".tr,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.yellow,
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
                            Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
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
                                                  const HomePage(),
                                            ));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8),
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
                                )),
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
