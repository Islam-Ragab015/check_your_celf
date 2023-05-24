// ignore_for_file: library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/general_check/GeneralHealthCheck.dart';
import 'package:diseases_checker/moduls/check/specific_check/SpecificHealthCheckForm.dart';
import 'package:diseases_checker/moduls/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralHealthCheckForm extends StatefulWidget {
  const GeneralHealthCheckForm({super.key});

  @override
  _GeneralHealthCheckFormState createState() => _GeneralHealthCheckFormState();
}

enum Gender { male, female, other }

class _GeneralHealthCheckFormState extends State<GeneralHealthCheckForm> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  int? age;
  double? weight;
  double? height;
  bool isSmoker = false;
  Gender gender = Gender.male;
  String? lifestyleChoice;
  MaritalStatus? maritalStatus;
  final recordNameController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: Text('General information'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: recordNameController,
                decoration: InputDecoration(labelText: 'Record Name'.tr),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a record name'.tr;
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'.tr),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age'.tr;
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number'.tr;
                  }
                  if (int.parse(value) < 0 || int.parse(value) > 150) {
                    return 'Please enter a valid age'.tr;
                  }
                  return null;
                },
                onSaved: (value) {
                  age = int.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Gender:'.tr),
                  const SizedBox(width: 65.0),
                  Radio(
                    value: Gender.male,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  Text('Male'.tr),
                  const SizedBox(width: 27.0),
                  Radio(
                    value: Gender.female,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  Text('Female'.tr),
                  const SizedBox(width: 8.0),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Marital Status:'.tr),
                  const SizedBox(width: 8.0),
                  Radio(
                    value: MaritalStatus.married,
                    groupValue: maritalStatus,
                    onChanged: (value) {
                      setState(() {
                        maritalStatus = value!;
                      });
                    },
                  ),
                  Text('Married'.tr),
                  const SizedBox(width: 8.0),
                  Radio(
                    value: MaritalStatus.single,
                    groupValue: maritalStatus,
                    onChanged: (value) {
                      setState(() {
                        maritalStatus = value!;
                      });
                    },
                  ),
                  Text('Single'.tr),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: weightController,
                decoration: InputDecoration(labelText: 'Weight (kg)'.tr),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight'.tr;
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number'.tr;
                  }
                  if (double.parse(value) < 0.5 || double.parse(value) > 500) {
                    return 'Please enter a valid weight'.tr;
                  }
                  return null;
                },
                onSaved: (value) {
                  weight = double.parse(value!);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: heightController,
                decoration: InputDecoration(labelText: 'Height (cm)'.tr),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height'.tr;
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number'.tr;
                  }
                  if (double.parse(value) < 10 || double.parse(value) > 300) {
                    return 'Please enter a valid height'.tr;
                  }
                  return null;
                },
                onSaved: (value) {
                  height = double.parse(value!);
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Lifestyle Choice'.tr),
                value: lifestyleChoice,
                items: ['Active'.tr, 'Sedentary'.tr].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a lifestyle choice'.tr;
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    lifestyleChoice = value;
                  });
                },
                onSaved: (value) {
                  lifestyleChoice = value;
                },
              ),
              const SizedBox(height: 40),
              MaterialButton(
                color: Colors.blue,
                height: 45,
                child: Text(
                  'Submit'.tr,
                  style: const TextStyle(fontSize: 22),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const General(),
                        ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
