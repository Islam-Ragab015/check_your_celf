import 'package:diseases_checker/moduls/settings_screens/local_storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLangauge extends GetxController {
  var appLocale = 'en';
  @override
  void onInit() async {
    super.onInit();
    LocalStroage localStroage = LocalStroage();
    appLocale = await localStroage.languageSelected ?? 'en';
    Get.updateLocale(Locale(appLocale));
    update();
  }

  void changeLanguage(String type) async {
    LocalStroage localStroage = LocalStroage();
    if (appLocale == type) {
      return;
    }
    if (type == 'ar') {
      appLocale = 'ar';
      localStroage.saveLanguage('ar');
    } else {
      appLocale = 'en';
      localStroage.saveLanguage('en');
    }
    update();
  }
}
