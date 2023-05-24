// ignore_for_file: file_names

import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/duration.dart';
import 'package:diseases_checker/moduls/check/specific_check/symptoms/heart/chest_pain_type.dart';
import 'package:diseases_checker/moduls/check/specific_check/symptoms/stroke/hypertension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Specific extends StatelessWidget {
  const Specific({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Diseases'.tr,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.blue,
            child: Stack(
              children: [
                Positioned.fill(
                    child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "images/back1.png",
                    fit: BoxFit.fill,
                  ),
                )),
                Column(
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Hypertension(),
                            ));
                      },
                      color: Colors.black45,
                      minWidth: double.infinity,
                      height: 100,
                      // Stroke disease button
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "1",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 7, 218, 14),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Stroke".tr,
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("number of Symptoms is 8".tr,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Chest_Pain_Type(),
                            ));
                      },
                      color: Colors.black45,
                      minWidth: double.infinity,
                      height: 100,
                      // Heart diseases button
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "2",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 7, 218, 14),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Heart Diseases".tr,
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("number of Symptoms is 8".tr,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MigraineDuration(),
                            ));
                      },
                      color: Colors.black45,
                      minWidth: double.infinity,
                      height: 100,
                      // Heart diseases button
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "3",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 7, 218, 14),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Migraine".tr,
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("number of Symptoms is 22".tr,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      color: Colors.black45,
                      minWidth: double.infinity,
                      height: 100,
                      // Heart diseases button
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "4",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 7, 218, 14),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Asthma".tr,
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Coming Soon ...".tr,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      color: Colors.black45,
                      minWidth: double.infinity,
                      height: 100,
                      // Heart diseases button
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "5",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 7, 218, 14),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Arthritis".tr,
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Coming Soon ...".tr,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      color: Colors.black45,
                      minWidth: double.infinity,
                      height: 100,
                      // Heart diseases button
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "6",
                            style: TextStyle(
                                fontSize: 40,
                                color: Color.fromARGB(255, 7, 218, 14),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Cancer".tr,
                                style: const TextStyle(
                                    fontSize: 23,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Coming Soon ...".tr,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 110,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
