// ignore_for_file: use_build_context_synchronously

import 'dart:io'; // Add this import statement

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late ImagePicker _imagePicker;
  File? _imageFile; // Change XFile to File

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _selectImage() async {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      useSafeArea: true,
      context: context,
      enableDrag: true,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(left: 80),
                child: Icon(
                  Icons.photo_library,
                  color: Colors.black,
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.only(right: 100),
                child: Text(
                  'Browse Gallery',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              onTap: () async {
                final image =
                    await _imagePicker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    _imageFile = File(image.path); // Convert XFile to File
                  });
                }
                Navigator.pop(context); // Close the bottom sheet
              },
            ),
            ListTile(
              leading: const Padding(
                padding: EdgeInsets.only(left: 80),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.only(right: 100),
                child: Text(
                  'Use a Camera',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              onTap: () async {
                final image =
                    await _imagePicker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  setState(() {
                    _imageFile = File(image.path); // Convert XFile to File
                  });
                }
                Navigator.pop(context); // Close the bottom sheet
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _selectImage,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!) as ImageProvider<Object>?
                          : const AssetImage('images/profile.jpg'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Islam Elsherif',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'islaminreallife@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Personal Information'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text('Age'),
                    subtitle: Text('30'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.wc),
                    title: Text('Gender'),
                    subtitle: Text('Male'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Marital Status'),
                    subtitle: Text('Single'),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
