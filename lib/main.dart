import 'package:diseases_checker/cubit/theme_cubit.dart';
import 'package:diseases_checker/moduls/settings_screens/utils_languages/translation.dart';
import 'package:diseases_checker/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(false),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, state) {
          return GetMaterialApp(
            // routes: {
            //   loginId:(p0) => Login(),
            //   changPassId:(p0) => ChangePass(),
            //   signUpId:(p0) => Signup(),
            //   nextSignup:(p0) => Next(),
            // },
            translations: Translation(),
            locale: const Locale('en'),
            fallbackLocale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            themeMode: state ? ThemeMode.dark : ThemeMode.light,

            //DarkTheme
            darkTheme: ThemeData.dark(),
            //App Theme
            theme: ThemeData(
              //bottomNavigationBar Theme
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed),
            ),

            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
