import 'package:digitect/controllers/local_controller.dart';
import 'package:digitect/controllers/theme.dart';
import 'package:digitect/screens/bottom_nav_bar.dart';
import 'package:digitect/utils/languages.dart';
import 'package:digitect/utils/our_theme.dart';
import 'package:digitect/utils/share_preferences_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharePreferenceUtil.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final localController = Get.put(LocaleController(), permanent: false);
    final themeController = Get.put(ThemeController(), permanent: false);

    if (themeController.isDarkTheme == null || RxStatus.loading().isSuccess) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return GetMaterialApp(
      translations: Languages(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: localController.local != null
          ? Locale(
              localController.local!.value, localController.countryCode!.value)
          : Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
      theme: themeController.isDarkTheme!.value
          ? OurTheme.darkTheme
          : OurTheme.lightTheme,
      home: const NaviBarScreen(),
    );
  }
}
