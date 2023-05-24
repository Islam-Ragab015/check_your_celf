// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diseases_checker/moduls/home/homepage.dart';
import 'package:flutter/material.dart';

class HeartResult extends StatelessWidget {
  final List<String> selectedSymptoms;

  const HeartResult({
    Key? key,
    required this.selectedSymptoms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort the selected symptoms alphabetically
    selectedSymptoms.sort();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.info),
        actions: [
          InkWell(
            child: const Icon(
              Icons.home,
              size: 37,
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                )),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        title: const Text('Results'),
      ),
      body: ListView.builder(
        itemCount: selectedSymptoms.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedSymptoms[index]),
          );
        },
      ),
    );
  }
}
