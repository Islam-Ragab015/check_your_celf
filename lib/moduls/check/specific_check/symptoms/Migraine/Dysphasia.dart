// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/Dysarthria.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class Dysphasia extends StatefulWidget {
  const Dysphasia({super.key});

  @override
  _DysphasiaState createState() => _DysphasiaState();
}

class _DysphasiaState extends State<Dysphasia> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController DysphasiaController = TextEditingController();

  String? _DysphasiaValue;

  final List<String> _DysphasiaOptions = [
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
              "11/22   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Dysphasia',
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
                  "images/Dysphasia.jpg",
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
                      "Dysphasia is a language disorder that affects a person's ability to communicate effectively. It can manifest as difficulty speaking, understanding spoken or written language, or both.Interestingly, research has shown that people with migraine may be at an increased risk for developing dysphasia during a migraine attack. ",
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
                          'Do you have Dysphasia?',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _DysphasiaValue,
                          items: _DysphasiaOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _DysphasiaValue = newValue;
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
                          BspcList.add(SpcList(name: 'Dysphasia', value: _DysphasiaValue.toString() ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Dysarthria(),
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
