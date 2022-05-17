import 'package:digitect/utils/our_theme.dart';
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
    Get.changeTheme(newValue ? OurTheme.darkTheme : OurTheme.lightTheme);
    isDarkTheme = newValue.obs;
    await SharePreferenceUtil.setBool('isDarkTheme', newValue);
  }
}
