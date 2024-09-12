// ignore_for_file: library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/heart/Resting_electrocardiography.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class FastingBloodSugar extends StatefulWidget {
  const FastingBloodSugar({super.key});

  @override
  _FastingBloodSugarState createState() => _FastingBloodSugarState();
}

class _FastingBloodSugarState extends State<FastingBloodSugar> {
  final _formKey = GlobalKey<FormState>();
  String? fastingBloodSugar;
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
              "4/8   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'fasting blood sugar',
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
                          'fasting blood sugar',
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
                          'Please choose fasting blood sugar level:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(
                              value: 'Lower than 120 mg/ml',
                              child: Text('Lower than 120 mg/ml'),
                            ),
                            DropdownMenuItem(
                              value: 'Greater than 120 mg/ml',
                              child: Text('Greater than 120 mg/ml'),
                            ),
                          ],
                          onChanged: (String? value) {
                            fastingBloodSugar = value;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please choose your fasting blood sugar level';
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
                          BspcList.add(SpcList(name: 'Fasting Blood Sugar', value: fastingBloodSugar.toString() ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RestingElectrocardiography(),
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
                      height: 73,
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
