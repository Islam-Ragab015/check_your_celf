// ignore_for_file: library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/stroke/Residence.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';

class WorkType extends StatefulWidget {
  const WorkType({super.key});

  @override
  _WorkTypeState createState() => _WorkTypeState();
}

class _WorkTypeState extends State<WorkType> {
  final _formKey = GlobalKey<FormState>();
  bool? hasFastingBloodSugar;
  String? _selectedWorkType;

  final List<String> _workTypes = [
    'Children',
    'Govt Job',
    'Never Worked',
    'Private',
    'Self-employed'
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
              "3/8   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Work Type',
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
                  "images/worktype.jpg",
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
                          'work environments',
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
                      'There is a relationship between work type and stroke risk, as certain types of jobs and work environments have been associated with a higher risk of stroke. For example, jobs that involve long hours of sitting, such as office work, have been linked to an increased risk of stroke compared to more physically active occupations.',
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
                          'What is your work type ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    DropdownButtonFormField<String>(
                      value: _selectedWorkType,
                      items: _workTypes.map((workType) {
                        return DropdownMenuItem<String>(
                          value: workType,
                          child: Text(workType),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Work Type',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedWorkType = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a work type';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    MaterialButton(
                      minWidth: double.infinity,
                      // color: Colors.blue,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          BspcList.add(SpcList(name: 'Work Type', value: _selectedWorkType.toString() ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Residence(),
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
