import 'package:diseases_checker/moduls/home/homepage.dart';
import 'package:flutter/material.dart';

class MigraineResult extends StatelessWidget {
  final List<String> selectedSymptoms;

  const MigraineResult({super.key, required this.selectedSymptoms});

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
