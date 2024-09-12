// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/SpecificHealthCheckForm.dart';
import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/frequency.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class MigraineDuration extends StatefulWidget {
  const MigraineDuration({super.key});

  @override
  _MigraineDurationState createState() => _MigraineDurationState();
}

class _MigraineDurationState extends State<MigraineDuration> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController MigraineDurationController = TextEditingController();
  final List<String> _MigraineDurations = [
    'Less than 4 days',
    '4 to 72 hours',
    'More than 72 hours',
  ];
  String? _selectedDuration;
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
              "1/22   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Duration',
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
                  "images/Duration.jpg",
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
                          'Migraine Duration',
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
                      "The duration of symptoms in the last episode of Migraine can vary from person to person. Typically, a migraine attack can last anywhere from 4 hours to 72 hours or more. The length and severity of the migraine attack can depend on various factors, including the individual's medical history, age, gender, triggers, and overall health.",
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
                          'MigraineDuration of Symptoms in the Last Episode (Days)',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 19.0),
                        DropdownButtonFormField<String>(
                          value: _selectedDuration,
                          items: _MigraineDurations.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedDuration = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select the MigraineDuration of your symptoms in the last episode';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Select MigraineDuration',
                          ),
                        ),
                        const SizedBox(height: 40.0),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BspcList.clear();
                          BspcList.add(SpcList(name: 'Duration', value: _selectedDuration.toString() ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MigraineFrequency(),
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
