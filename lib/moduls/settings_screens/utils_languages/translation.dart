import 'package:diseases_checker/moduls/settings_screens/utils_languages/ar.dart';
import 'package:diseases_checker/moduls/settings_screens/utils_languages/en.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
