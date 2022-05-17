import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar_SA': {
          'settings': 'إعدادات',
          'about': 'عن',
          'profile': 'حساب تعريفي',
          'home': 'مسكن',
          'darkTheme': 'مظهر داكن',
        },
        'en_US': {
          'settings': 'settings',
          'about': 'About',
          'profile': 'Profile',
          'home': 'Home',
          'darkTheme': 'Dark Theme',
        },
      };
}
