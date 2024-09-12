// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/stroke/have_stroke_before.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class SmokingStatus extends StatefulWidget {
  const SmokingStatus({super.key});

  @override
  _SmokingStatusState createState() => _SmokingStatusState();
}

class _SmokingStatusState extends State<SmokingStatus> {
  final _formKey = GlobalKey<FormState>();

  String? SmokingStatus;
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
              "7/8   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Smoking Status',
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
                  "images/SmokingStatus.jpg",
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
                          'Smoking Status',
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
                      "Smoking is a major risk factor for stroke. Smoking increases the risk of stroke by damaging blood vessels, making them more likely to become blocked or burst. This can lead to ischemic strokes and hemorrhagic strokes. Quitting smoking can reduce the risk of stroke and other cardiovascular diseases. It's never too late to quit smoking - even if you've been smoking for years.",
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
                          'Please select your smoking status:',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(
                              value: 'formerly smoked',
                              child: Text('Formerly Smoked'),
                            ),
                            DropdownMenuItem(
                              value: 'never smoked',
                              child: Text('Never Smoked'),
                            ),
                            DropdownMenuItem(
                              value: 'smokes',
                              child: Text('Smokes'),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              SmokingStatus = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your smoking status';
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
                      height: 60,
                    ),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BspcList.add(SpcList(name: 'Smoking Status', value: SmokingStatus.toString() ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HaveStrokeBefore(),
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
