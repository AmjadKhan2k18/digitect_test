import 'package:digitect/controllers/local_controller.dart';
import 'package:digitect/controllers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

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
              Switch(
                value: themeController.isDarkTheme!.value,
                onChanged: (value) => themeController.setDarkTheme(value),
              ),
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
  // final String label;
  // final int selectedIndex;
  // final Function(int) onChanged;
  // final List<String> options;

  // const _HorizontalToggle({
  //   required this.label,
  //   required this.selectedIndex,
  //   required this.onChanged,
  //   required this.options,
  // });

  @override
  State<_HorizontalToggle> createState() => _HorizontalToggleState();
}

class _HorizontalToggleState extends State<_HorizontalToggle> {
  late List<bool> isSelected;

  @override
  void initState() {
    // TODO: implement initState
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
              onPressed: localController.changeLanguageIndex,
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
