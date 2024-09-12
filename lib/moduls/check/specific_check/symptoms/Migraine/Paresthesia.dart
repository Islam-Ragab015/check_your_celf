// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/DPF.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class Paresthesia extends StatefulWidget {
  const Paresthesia({super.key});

  @override
  _ParesthesiaState createState() => _ParesthesiaState();
}

class _ParesthesiaState extends State<Paresthesia> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController ParesthesiaController = TextEditingController();

  String? _ParesthesiaValue;

  final List<String> _ParesthesiaOptions = [
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
              "21/22   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Paresthesia',
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
                  "images/Paresthesia.jpg",
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
                          'Paresthesia',
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
                      "Paresthesia refers to abnormal sensations such as tingling, burning, numbness, or prickling, and can also occur during a migraine attack. In some cases, paresthesia may be a warning sign that a migraine is about to occur.",
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
                          'Do you have Paresthesia ?',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _ParesthesiaValue,
                          items: _ParesthesiaOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _ParesthesiaValue = newValue;
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
                          BspcList.add(SpcList(name: 'Paresthesia', value: _ParesthesiaValue.toString() ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FamilyBackground(),
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
