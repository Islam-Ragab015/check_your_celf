import 'package:get_storage/get_storage.dart';

class LocalStroage {
  //write
  void saveLanguage(String lang) async {
    await GetStorage().write("lang", lang);
  }

  //Read
  Future get languageSelected async {
    return await GetStorage().read("lang");
  }
}
