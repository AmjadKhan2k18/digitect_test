import 'package:digitect/utils/share_preferences_util.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  RxList<bool> isSelected = [false, false].obs;

  RxString? local;
  RxString? countryCode;

  LocaleController() {
    fetchLocale();
  }

  fetchLocale() async {
    final localeString = SharePreferenceUtil.getString('locale');
    if (localeString == null) return;

    final tempList = localeString.split('_');
    local = tempList[0].obs;
    countryCode = tempList[1].obs;

    if (localeString == 'ar_SA') {
      changeLanguageIndex(0, firstTime: true);
    } else {
      changeLanguageIndex(1, firstTime: true);
    }
  }

  void changeLanguageIndex(int index, {bool firstTime = false}) {
    for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
      if (buttonIndex == index) {
        isSelected[buttonIndex] = true;
      } else {
        isSelected[buttonIndex] = false;
      }
    }
    if (!firstTime) {
      SharePreferenceUtil.setString('locale', index == 0 ? 'ar_SA' : 'en_US');
      fetchLocale();
    }
  }
}
