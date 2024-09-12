import 'package:diseases_checker/moduls/home/homepage.dart';
import 'package:diseases_checker/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class MigraineResult extends StatelessWidget {
  final List<String> selectedSymptoms;

  const MigraineResult({super.key, required this.selectedSymptoms});

  @override
  Widget build(BuildContext context) {
    // Sort the selected symptoms alphabetically
    selectedSymptoms.sort();
    final url = Uri.parse("https://en.wikipedia.org/wiki/Migraine");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        leading: GestureDetector(
          child: const Icon(
            Icons.home,
            size: 30,
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          },
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButton(
                child: const Text(
                  "Read more",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 15),
                ),
                onPressed: () async {
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CircularPercentIndicator(
            animation: true,
            animationDuration: 1000,
            radius: 90.0,
            lineWidth: 18.0,
            percent: .22,
            center: const Text(
              "22%",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            progressColor: Colors.deepPurple,
            backgroundColor: Colors.deepPurple.shade100,
            circularStrokeCap: CircularStrokeCap.round,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "No diseases found,You are healthy",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: [
              Text(
                "Advice",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Good news we found no diseases")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Your Data",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: BspcList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text((index + 1).toString()),
                    title: Text(BspcList[index].name),
                    trailing: Text(BspcList[index].value),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
