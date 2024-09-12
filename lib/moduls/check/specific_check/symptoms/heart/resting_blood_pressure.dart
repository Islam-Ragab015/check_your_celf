// ignore_for_file: library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/heart/Cholesterol.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class RestingBloodPressure extends StatefulWidget {
  const RestingBloodPressure({super.key});

  @override
  _RestingBloodPressureState createState() => _RestingBloodPressureState();
}

class _RestingBloodPressureState extends State<RestingBloodPressure> {
  final _formKey = GlobalKey<FormState>();
  String? _RBP;

  TextEditingController rbpController = TextEditingController();
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
              "2/8   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'RBP',
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
                  "images/RBP.jpg",
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
                          'Resting blood pressure',
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
                      "Resting blood pressure (RBP) is a major risk factor for developing cardiovascular disease (CVD), When RBP is consistently high, it puts extra strain on the heart and blood vessels, which can lead to damage over time. This can lead to an increased risk of heart attacks. It is important to maintain healthy blood pressure levels to reduce the risk of heart disease.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.53,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Please select your Resting blood pressure level:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(
                              value: 'Less than 120/80 mmHg',
                              child: Text('less than 120/80 mmHg'),
                            ),
                            DropdownMenuItem(
                              value: 'above 140/90',
                              child: Text('More than 140/90 mmHg'),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              _RBP = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your Resting blood pressure level';
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
                      height: 50,
                    ),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BspcList.add(SpcList(name: 'RBP', value: _RBP.toString() ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Cholesterol(),
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
