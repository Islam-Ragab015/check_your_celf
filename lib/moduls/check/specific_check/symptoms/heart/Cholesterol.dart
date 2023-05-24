// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:diseases_checker/moduls/check/specific_check/symptoms/heart/fasting_blood_sugar.dart';
import 'package:flutter/material.dart';

class Cholesterol extends StatefulWidget {
  const Cholesterol({super.key});

  @override
  _CholesterolState createState() => _CholesterolState();
}

class _CholesterolState extends State<Cholesterol> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cholesterolController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: const [
            Center(
                child: Text(
              "3/8   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Cholesterol',
            style: TextStyle(fontSize: 22, color: Colors.green),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Opacity(
                opacity: 0.4,
                child: Image.asset(
                  "images/Cholesterol.jpg",
                  fit: BoxFit.fill,
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 34),
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.black12,
                      child: const Center(
                        child: Text(
                          'Cholesterol',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Cholesterol is a waxy, fat-like substance that's found in all cells of the body. While our bodies need some cholesterol to make hormones and other substances, too much cholesterol can build up in the arteries that supply blood to the heart. This buildup can narrow or block the arteries, leading to a condition called coronary artery disease (CAD).",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.53,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Please select your Cholesterol level:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(
                              value: 'less than 200 mg/dL',
                              child: Text('less than 200 mg/dL'),
                            ),
                            DropdownMenuItem(
                              value: '200-239 mg/dL',
                              child: Text('200-239 mg/dL'),
                            ),
                            DropdownMenuItem(
                              value: 'More than 240 mg/dL',
                              child: Text('More than 240 mg/dL'),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your Cholesterol level';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(),
                            hintText: 'Select one',
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // final glucoseLevel = _glucoseController.text;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FastingBloodSugar(),
                              ));
                        } else {
                          return;
                        }
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
