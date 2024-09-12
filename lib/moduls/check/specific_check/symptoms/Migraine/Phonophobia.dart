// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

import 'Visual.dart';

class Phonophobia extends StatefulWidget {
  const Phonophobia({super.key});

  @override
  _PhonophobiaState createState() => _PhonophobiaState();
}

class _PhonophobiaState extends State<Phonophobia> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController PhonophobiaController = TextEditingController();

  String? _phonophobiaValue;

  final List<String> _phonophobiaOptions = [
    'Yes',
    'No',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
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
                "8/22   ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
            ],
            title: const Text(
              'Phonophobia',
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
                    "images/Phonophobia.jpg",
                    fit: BoxFit.fill,
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 60,
                        color: Colors.black12,
                        child: const Center(
                          child: Text(
                            'Noise sensitivity',
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
                        "Phonophobia is a condition characterized by an abnormal sensitivity to sound. In the case of migraine, phonophobia can be a symptom that occurs during an attack. During a migraine attack, the brain becomes hypersensitive to sensory stimuli, including sound. This sensitivity can cause a person to experience discomfort or pain when exposed to normal levels of noise.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          height: 1.53,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Do you have Phonophobia?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          DropdownButtonFormField<String>(
                            value: _phonophobiaValue,
                            items: _phonophobiaOptions.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _phonophobiaValue = newValue;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select an option';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Select an option'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 65,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BspcList.add(SpcList(name: 'Phonophobia', value: _phonophobiaValue.toString() ));

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Visual(),
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
      ),
    );
  }
}
