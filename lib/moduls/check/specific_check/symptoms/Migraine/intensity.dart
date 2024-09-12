// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/Nauseous_feeling.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class MigraineIntensity extends StatefulWidget {
  const MigraineIntensity({super.key});

  @override
  _MigraineIntensityState createState() => _MigraineIntensityState();
}

class _MigraineIntensityState extends State<MigraineIntensity> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController MigraineIntensityController = TextEditingController();

  String? _painIntensity;

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
              "5/22   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Intensity',
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
                  "images/MigraineIntensity.jpg",
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
                          'Migraine Intensity',
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
                      "Pain intensity is usually described as none, mild, medium, or severe. None means the absence of pain, while mild pain is typically a low-level discomfort that does not interfere with daily activities. Medium pain is more intense and may cause some disruption to normal activities, while severe pain is debilitating and may prevent the individual from carrying out any activities.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.53,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select pain intensity:',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        DropdownButtonFormField<String>(
                          value: _painIntensity,
                          onChanged: (String? newValue) {
                            setState(() {
                              _painIntensity = newValue;
                            });
                          },
                          items: <String>['None', 'Mild', 'Medium', 'Severe']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a pain intensity';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 80.0),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BspcList.add(SpcList(name: 'Intensity', value: _painIntensity.toString() ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NauseousFeeling(),
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
