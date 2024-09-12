// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/Dysphasia.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class Sensory extends StatefulWidget {
  const Sensory({super.key});

  @override
  _SensoryState createState() => _SensoryState();
}

class _SensoryState extends State<Sensory> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController SensoryController = TextEditingController();

  int? _selectedNumberOfSymptoms;
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
              "10/22   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Sensory',
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
                  "images/Sensory.jpg",
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
                          'reversible sensory',
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
                      "Migraines can cause a wide range of symptoms beyond just headaches, including sensory disturbances such as tingling or numbness in the face, hands, or feet, and visual disturbances like flashing lights or blind spots.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.53,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Number of Reversible Sensory Symptoms:',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20.0),
                        DropdownButtonFormField<int>(
                          value: _selectedNumberOfSymptoms,
                          items: List.generate(4, (index) {
                            return DropdownMenuItem<int>(
                              value: index,
                              child: Text(index.toString()),
                            );
                          }),
                          onChanged: (value) {
                            setState(() {
                              _selectedNumberOfSymptoms = value;
                            });
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Choose Number of Symptoms',
                            hintText: 'Select number of symptoms',
                          ),
                          validator: (value) {
                            if (value == null) {
                              return 'Please choose a number of symptoms';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 60.0),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 65,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BspcList.add(SpcList(name: 'Sensory', value: _selectedNumberOfSymptoms.toString() ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Dysphasia(),
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
