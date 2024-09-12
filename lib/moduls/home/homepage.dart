// ignore_for_file: use_build_context_synchronously

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:diseases_checker/moduls/appbar_screan/about_us_screen.dart';
import 'package:diseases_checker/moduls/appbar_screan/give_feedback_screen.dart';
import 'package:diseases_checker/moduls/appbar_screan/help_center_screen.dart';
import 'package:diseases_checker/moduls/appbar_screan/privacy_screen.dart';
import 'package:diseases_checker/moduls/appbar_screan/profile_screen.dart';
import 'package:diseases_checker/moduls/appbar_screan/reports_screen.dart';
import 'package:diseases_checker/moduls/appbar_screan/tell_friend_screen.dart';
import 'package:diseases_checker/moduls/authentication/login/login.dart';
import 'package:diseases_checker/moduls/check/general_check/GeneralHealthCheckForm.dart';
import 'package:diseases_checker/moduls/check/specific_check/SpecificHealthCheckForm.dart';
import 'package:diseases_checker/moduls/settings_screens/settings.dart';
import 'package:diseases_checker/pages/chat_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    // Check if the user is already signed in on app launch
  }

  void navigateToNextPage(BuildContext context, String recordName) {
    if (recordName.isEmpty) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.bottomSlide,
        title: 'Empty Record Name',
        desc: 'Please enter a name for the record.',
        btnOkOnPress: () {},
      ).show();
    } else {
      Navigator.pushNamed(context, '/next-page', arguments: recordName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        title: Text("Check".tr),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //profile IconButton
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile(),
                        ));
                  },
                  icon: const Icon(
                    Icons.person,
                    size: 27,
                  )),
              //Messages IconButton
              const SizedBox(
                width: 10,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.message,
                    size: 27,
                  )),
              const SizedBox(
                width: 10,
              ),
              //Settings IconButton
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingsPage(),
                        ));
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 27,
                  )),
            ],
          ),
        ],
      ),
      //drawer
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Column(
                children: [
                  const UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.red,
                        child: Text("I"),
                      ),
                      accountName: Text("islam"),
                      accountEmail:
                          Text("Logged in as islaminreallife@gmail.com")),
                  const SizedBox(height: 20),
                  ListTile(
                    title: Text("My Reports".tr),
                    leading: const Icon(Icons.report),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Reports(),
                          ));
                    },
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    title: Text("Help".tr),
                    leading: const Icon(Icons.help),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpPage(),
                          ));
                    },
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    title: Text("Policies and Terms".tr),
                    leading: const Icon(Icons.policy_sharp),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PoliciesAndTermsPage(),
                          ));
                    },
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    title: Text("About us".tr),
                    leading: const Icon(Icons.details_sharp),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutUsPage(),
                          ));
                    },
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    title: Text("Log out".tr),
                    leading: const Icon(Icons.logout),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(height: 30),
                  ListTile(
                    title: Text("Tell a Friend".tr),
                    leading: const Icon(Icons.share_outlined),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TellAFriendPage(),
                          ));
                    },
                  ),
                  const SizedBox(height: 10),
                  ListTile(
                    title: Text("Give a feedback".tr),
                    leading: const Icon(Icons.feedback),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FeedbackPage(),
                          ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 87, 155),
      body: Stack(
        children: [
          Positioned.fill(
              child: Opacity(
            opacity: 0.4,
            child: Image.asset(
              "images/wholebodyhealth.png",
              fit: BoxFit.fill,
            ),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(children: [
                        Column(
                          children: [
                            // Diseases Check buttons
                            Form(
                              key: formKey,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 160,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: const Color(0x9F3D416E)),
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
                                                        const GeneralHealthCheckForm(),
                                                  ));
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                      color: Colors.orange,
                                                      width: 3)),
                                              child: Column(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .medical_services_rounded,
                                                    size: 32,
                                                    color: Colors.orange,
                                                  ),
                                                  // Text(
                                                  //   "General Diseases Check".tr,
                                                  //   textAlign: TextAlign.center,
                                                  //   style: const TextStyle(
                                                  //     color: Colors.orange,
                                                  //     fontWeight:
                                                  //         FontWeight.bold,
                                                  //     fontSize: 18,
                                                  //   ),
                                                  // ),
                                                  DefaultTextStyle(
                                                    style: const TextStyle(
                                                      fontSize: 22.0,
                                                      fontFamily: 'Agne',
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    child: AnimatedTextKit(
                                                      animatedTexts: [
                                                        TypewriterAnimatedText(
                                                          'General Diseases Check'
                                                              .tr,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                      repeatForever: true,
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const GeneralHealthCheckForm(),
                                                            ));
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      height: 160,
                                      width: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: const Color(0x9F3D416E)),
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
                                                        const HealthCheckScreen(),
                                                  ));
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Colors.transparent,
                                                  border: Border.all(
                                                      color: Colors.orange,
                                                      width: 3)),
                                              child: Column(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .medical_services_rounded,
                                                    size: 32,
                                                    color: Colors.orange,
                                                  ),
                                                  // Text(
                                                  //   "Specific Diseases Check"
                                                  //       .tr,
                                                  //   textAlign: TextAlign.center,
                                                  //   style: const TextStyle(
                                                  //     color: Colors.orange,
                                                  //     fontWeight:
                                                  //         FontWeight.bold,
                                                  //     fontSize: 18,
                                                  //   ),
                                                  // ),
                                                  DefaultTextStyle(
                                                    style: const TextStyle(
                                                      fontSize: 22.0,
                                                      fontFamily: 'Agne',
                                                      color: Colors.orange,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    child: AnimatedTextKit(
                                                      animatedTexts: [
                                                        TypewriterAnimatedText(
                                                          'Specific Diseases Check'
                                                              .tr,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                      repeatForever: true,
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const HealthCheckScreen(),
                                                            ));
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        )
                      ])),
                ],
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ],
      ),
    );
  }
}

// Define a widget with const constructor
class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.email,
    required this.displayName,
    required this.photoURL,
    required this.uid,
  });

  final String email;
  final String displayName;
  final String photoURL;
  final String uid;

  @override
  Widget build(BuildContext context) {
    // Widget implementation
    return Container();
  }
}
