import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'.tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Frequently Asked Questions'.tr,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            buildQuestion(
              context: context,
              question: 'How do I use this app?'.tr,
              answer:
                  'To use this app, simply open it and follow the on-screen instructions to input your symptoms and receive a prediction and early diagnosis for possible diseases.'
                      .tr,
            ),
            buildQuestion(
              context: context,
              question: 'What diseases can this app predict and diagnose?'.tr,
              answer:
                  'This app can predict and diagnose a variety of diseases, including but not limited to: diabetes, hypertension, heart disease, and cancer.'
                      .tr,
            ),
            buildQuestion(
              context: context,
              question: 'Is my personal information secure?'.tr,
              answer:
                  'Yes, we take the security of your personal information very seriously. We use industry-standard security measures to protect your data and ensure your privacy.'
                      .tr,
            ),
            buildQuestion(
              context: context,
              question: 'What if I disagree with the diagnosis?'.tr,
              answer:
                  'While our app uses advanced algorithms to provide accurate predictions and diagnoses, we understand that there may be cases where a diagnosis is incorrect or disputed. We recommend seeking a second opinion from a medical professional if you have any concerns.'
                      .tr,
            ),
            buildQuestion(
              context: context,
              question: 'How can I provide feedback or report a bug?'.tr,
              answer:
                  'We welcome any feedback or bug reports from our users. You can contact us through the app or by emailing our support team at islaminreallife@gmail.com '
                      .tr,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestion({
    required BuildContext context,
    required String question,
    required String answer,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            answer,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: Theme.of(context).dividerColor,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
