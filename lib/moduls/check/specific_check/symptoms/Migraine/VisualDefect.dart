// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/Ataxia.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class VisualDefect extends StatefulWidget {
  const VisualDefect({super.key});

  @override
  _VisualDefectState createState() => _VisualDefectState();
}

class _VisualDefectState extends State<VisualDefect> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController VisualDefectController = TextEditingController();

  String? _VisualDefectValue;

  final List<String> _VisualDefectOptions = [
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
              "18/22   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Visual Defect',
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
                  "images/VisualDefect.jpg",
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
                          'Visual Defect',
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
                      "VisualDefect, or double vision, can be a symptom of a migraine. Double vision may appear in one or both eyes, and it can be constant or intermittent. Double vision can occur during a migraine attack due to various reasons such as changes in blood flow to the brain, nerve irritation, or muscle weakness.",
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
                          'Do you have Visual Defect?',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _VisualDefectValue,
                          items: _VisualDefectOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _VisualDefectValue = newValue;
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
                    const SizedBox(height: 60.0),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 65,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BspcList.add(SpcList(name: 'Visual Defect', value: _VisualDefectValue.toString() ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Ataxia(),
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
