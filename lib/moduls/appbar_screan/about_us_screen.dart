import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Our Mission'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Our mission is to improve healthcare through the use of technology, by providing accurate predictions and early diagnosis of diseases to save lives and improve quality of life for patients.'
                    .tr,
                style: const TextStyle(
                  height: 1.5,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Our Team'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // mohamed ashraf

            buildTeamMember(
              context: context,
              name: 'Ahmed Ibrahem',
              position: 'DataBase & Front-End Developer',
            ),
            buildTeamMember(
              context: context,
              name: 'Islam Mahmoud',
              position: 'Back-End Developer',
            ),
            buildTeamMember(
              context: context,
              name: 'Mohamed Ashraf',
              position: 'Machine Learning Engineer',
            ),
            // Zeyad Hamada
            buildTeamMember(
              context: context,
              name: 'Zeyad Hamada',
              position: 'Machine Learning Engineer',
            ),
            buildTeamMember(
              context: context,
              name: 'Roshdy Reda',
              position: 'Mobile App Dev',
            ),
            buildTeamMember(
              context: context,
              name: 'Islam Elsherif',
              position: 'Mobile App and UI & UX Dev',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTeamMember({
    required BuildContext context,
    required String name,
    required String position,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      position,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: Theme.of(context).dividerColor,
          ),
          const SizedBox(height: 9),
        ],
      ),
    );
  }
}
