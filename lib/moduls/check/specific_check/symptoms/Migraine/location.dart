// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:diseases_checker/moduls/check/specific_check/symptoms/Migraine/character.dart';
import 'package:flutter/material.dart';

class MigraineLocation extends StatefulWidget {
  const MigraineLocation({super.key});

  @override
  _MigraineLocationState createState() => _MigraineLocationState();
}

class _MigraineLocationState extends State<MigraineLocation> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController MigraineLocationController = TextEditingController();

  String? _painLocation;
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
              "3/22   ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
          title: const Text(
            'Location',
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
                  "images/location.jpg",
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
                          'Migraine location',
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
                      "Migraine is a type of headache that is often described as a moderate to severe throbbing pain, typically on one side of the head (unilateral), although it's possible for the pain to occur on both sides (bilateral) or switch sides during an attack.In some cases, the location of the pain can help differentiate between migraine headaches and other types of headaches.",
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
                          'Location',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          value: _painLocation,
                          items: const [
                            DropdownMenuItem(
                                value: 'None', child: Text('None')),
                            DropdownMenuItem(
                                value: 'Unilateral', child: Text('Unilateral')),
                            DropdownMenuItem(
                                value: 'Bilateral', child: Text('Bilateral')),
                          ],
                          validator: (value) {
                            if (value == null) {
                              return 'Please select a pain location';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _painLocation = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // final glucoseLevel = _glucoseController.text;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MigraineCharacter(),
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
