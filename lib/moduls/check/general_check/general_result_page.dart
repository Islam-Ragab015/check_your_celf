import 'package:diseases_checker/moduls/check/general_check/GeneralHealthCheck.dart';
import 'package:diseases_checker/moduls/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralResultsPage extends StatelessWidget {
  const GeneralResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _url = Uri.parse("https://en.wikipedia.org/wiki/Stroke");
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
                  if (await canLaunchUrl(_url)) {
                    await launchUrl(_url, mode: LaunchMode.externalApplication);
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
            percent: .40,
            center: const Text(
              "40%",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            progressColor: Colors.deepPurple,
            backgroundColor: Colors.deepPurple.shade100,
            circularStrokeCap: CircularStrokeCap.round,
          ),
          const SizedBox(
            height: 50,
          ),
          const Text("No diseases found,You are healthy"),
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
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text('${(index + 1).toString()}.'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(finalChoices[index].title),
                      const Spacer(),
                      Text(finalChoices[index].choice),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: finalChoices.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
