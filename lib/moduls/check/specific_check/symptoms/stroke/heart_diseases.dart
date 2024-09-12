// ignore_for_file: library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/stroke/Work_Type.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class HeartDiseases extends StatefulWidget {
  const HeartDiseases({super.key});

  @override
  _HeartDiseasesState createState() => _HeartDiseasesState();
}

class _HeartDiseasesState extends State<HeartDiseases> {
  final _formKey = GlobalKey<FormState>();
  bool? hasFastingBloodSugar;

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
            'Heart Diseases',
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
                  "images/heartdisease.jpeg",
                  fit: BoxFit.fill,
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.black12,
                      child: const Center(
                        child: Text(
                          'cardiovascular',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Heart disease is a general term that includes many types of heart problems. It\'s also called cardiovascular disease, which means heart and blood vessel disease. Heart disease is the leading cause of death in the United States, but there are ways to prevent and manage many types of heart disease.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.53,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 80,
                      color: Colors.black12,
                      child: const Center(
                        child: Text(
                          'Do you have Chest pain or Fainting ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    DropdownButtonFormField<bool>(
                      value: hasFastingBloodSugar,
                      decoration: const InputDecoration(
                        labelText: 'Select an option',
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: true,
                          child: Text('Yes'),
                        ),
                        DropdownMenuItem(
                          value: false,
                          child: Text('No'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          hasFastingBloodSugar = value;
                        });
                      },
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      minWidth: double.infinity,
                      // color: Colors.blue,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BspcList.add(SpcList(name: 'Heart Diseases', value: hasFastingBloodSugar! ? 'Yes' : 'No' ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WorkType(),
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
