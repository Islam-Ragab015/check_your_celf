import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PoliciesAndTermsPage extends StatelessWidget {
  const PoliciesAndTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Policies and Terms'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Privacy Policy'.tr,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'We at the Prediction and Early Diagnosis of Diseases app, developed by RAMIZI Corp, are committed to protecting your privacy. This Privacy Policy explains how we collect, use, disclose, and protect your information when you use our app. By using our app, you consent to our Privacy Policy.'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '1. Information we collect: We may collect personal information such as your name, email address, and health information (such as symptoms and medical history) when you use our app.'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '2. How we use your information: We use your information to provide and improve our services, communicate with you, and comply with legal obligations.'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '3. Sharing of information: We may share your information with third-party service providers who help us operate our app or with law enforcement agencies where required by law.'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '4. Security of information: We take reasonable steps to protect your information from unauthorized access, disclosure, or destruction. However, no method of transmission over the Internet or electronic storage is 100% secure.'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '5. Your rights: You have the right to access, correct, or delete your information. If you wish to exercise these rights, please contact us at islaminreallife@gmail.com '
                    .tr,
              ),
              const SizedBox(height: 16),
              Text(
                'Terms of Service'.tr,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'By accessing or using the Prediction and Early Diagnosis of Diseases app, you agree to be bound by these Terms of Service:'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '1. Use of the app: Our app is intended for informational purposes only and should not be used as a substitute for professional medical advice.'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '2. Ownership and intellectual property: We own all rights, titles, and interests in and to our app and its contents. You may not copy, modify, distribute, or reproduce any part of our app without our prior written permission.'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '3. Disclaimer of warranties: We do not warrant that our app will meet your requirements or that it will be error-free or uninterrupted. The app is provided as is without warranty of any kind.'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '4. Limitation of liability: To the extent permitted by law, we shall not be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in connection with the use of our app.'
                    .tr,
              ),
              const SizedBox(height: 8),
              Text(
                '5. Changes to the Terms of Service: We reserve the right to change these Terms of Service from time to time without notice. Your continued use of our app after any such changes constitutes your acceptance of the new Terms of Service.'
                    .tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
