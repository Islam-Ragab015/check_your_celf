// ignore_for_file: camel_case_types

import 'package:diseases_checker/moduls/check/specific_check/SpecificHealthCheckForm.dart';
import 'package:diseases_checker/moduls/check/specific_check/symptoms/heart/resting_blood_pressure.dart';
import 'package:flutter/material.dart';

class Chest_Pain_Type extends StatefulWidget {
  const Chest_Pain_Type({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Chest_Pain_TypeState createState() => _Chest_Pain_TypeState();
}

class _Chest_Pain_TypeState extends State<Chest_Pain_Type> {
  final _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  double? Chest_Pain_Type;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Warning'),
                    content: const Text(
                        'If you go back, your symptom record will be lost.'),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HealthCheckScreen(),
                              ));
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          actions: const [
            Center(
                child: Text(
              "1/8   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Angina',
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
                  "images/Chest_Pain.jpg",
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
                          'Chest Pain',
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
                      "Chest pain is a common symptom of many heart diseases, There are several types of chest pain that may be associated with heart disease, including:Angina: This is chest pain or discomfort caused by reduced blood flow to the heart muscle due to narrowed or blocked coronary arteries.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.53,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Please select your Chest Pain Type:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(
                              value: 'Typical Angina',
                              child: Text('Typical Angina'),
                            ),
                            DropdownMenuItem(
                              value: 'Atypical Angina',
                              child: Text('Atypical Angina'),
                            ),
                            DropdownMenuItem(
                              value: 'Non-Anginal Pain',
                              child: Text('Non-Anginal Pain'),
                            ),
                            DropdownMenuItem(
                              value: 'Asymptomatic',
                              child: Text('Asymptomatic'),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your Chest Pain Type';
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
                      height: 70,
                    ),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RestingBloodPressure(),
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
