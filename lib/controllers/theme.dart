import 'package:digitect/utils/share_preferences_util.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool? isDarkTheme;

  ThemeController() {
    init();
  }

  init() async {
    isDarkTheme = SharePreferenceUtil.getBool('isDarkTheme').obs;
  }

  setDarkTheme(bool newValue) async {
    await SharePreferenceUtil.setBool('isDarkTheme', newValue);
    isDarkTheme = newValue.obs;
  }
}
