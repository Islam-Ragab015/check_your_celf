// ignore_for_file: library_private_types_in_public_api

import 'package:diseases_checker/cubit/theme_cubit.dart';
import 'package:diseases_checker/moduls/settings_screens/utils_languages/controller/app_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final String _appVersion = '';
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings'.tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile(
                value: _notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
                title: Text('Enable Notifications'.tr),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ThemeCubit, bool>(
                builder: (context, state) {
                  return SwitchListTile(
                      value: state,
                      onChanged: (value) {
                        BlocProvider.of<ThemeCubit>(context)
                            .toggleTheme(valu: value);
                      },
                      title: Text(
                        'Enable DarkMode'.tr,
                      ));
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Language".tr,
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 16),
                  GetBuilder<AppLangauge>(
                    init: AppLangauge(),
                    builder: (controller) {
                      return DropdownButton(
                        items: const [
                          DropdownMenuItem(
                            value: 'en',
                            child: Row(
                              children: [
                                Text("English"),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                              value: 'ar', child: Text("العَرَبِيَّةِ"))
                        ],
                        value: controller.appLocale,
                        onChanged: (value) {
                          controller.changeLanguage(value!);
                          Get.updateLocale(Locale(value));
                        },
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 32),
              Text('App Version'.tr,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  '1.0.0',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Text(_appVersion),
            ],
          ),
        ),
      ),
    );
  }
}
