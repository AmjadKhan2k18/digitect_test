import 'package:digitect/controllers/local_controller.dart';
import 'package:digitect/controllers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController(), permanent: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('darkTheme'.tr),
              Obx(
                () => Switch(
                  value: themeController.isDarkTheme!.value,
                  onChanged: (value) => setState(() {
                    themeController.setDarkTheme(value);
                  }),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          _HorizontalToggle(),
        ],
      ),
    );
  }
}

class _HorizontalToggle extends StatefulWidget {
  @override
  State<_HorizontalToggle> createState() => _HorizontalToggleState();
}

class _HorizontalToggleState extends State<_HorizontalToggle> {
  late List<bool> isSelected;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localController = Get.put(LocaleController(), permanent: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Languages',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 15),
        Obx(() => ToggleButtons(
              onPressed: (index) => setState(
                () => localController.changeLanguageIndex(index),
              ),
              children: const [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Arabic'),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('English'),
                )
              ],
              isSelected: localController.isSelected,
            ))
      ],
    );
  }
}
