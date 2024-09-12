// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/Vertigo.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class Dysarthria extends StatefulWidget {
  const Dysarthria({super.key});

  @override
  _DysarthriaState createState() => _DysarthriaState();
}

class _DysarthriaState extends State<Dysarthria> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController DysarthriaController = TextEditingController();

  String? _DysarthriaValue;

  final List<String> _DysarthriaOptions = [
    'Yes',
    'No',
  ];
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
              "12/22   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Dysarthria',
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
                  "images/Dysarthria.jpeg",
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
                          'Dysarthria',
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
                      "Dysarthria is a speech disorder that affects a person's ability to articulate words clearly and effectively due to weakness or lack of coordination of the muscles used in speech.While dysarthria is not typically associated with migraine, in some cases, it may be a symptom experienced during a migraine attack.",
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
                          'Do you have Dysarthria?',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _DysarthriaValue,
                          items: _DysarthriaOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _DysarthriaValue = newValue;
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

                          BspcList.add(SpcList(name: 'Dysarthria', value: _DysarthriaValue.toString() ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Vertigo(),
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
