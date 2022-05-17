import 'package:digitect/controllers/nav_bar_controller.dart';
import 'package:digitect/screens/tabs/home.dart';
import 'package:digitect/screens/tabs/about.dart';
import 'package:digitect/screens/tabs/profile.dart';
import 'package:digitect/screens/tabs/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NaviBarScreen extends StatefulWidget {
  const NaviBarScreen({Key? key}) : super(key: key);

  @override
  State<NaviBarScreen> createState() => _NaviBarScreenState();
}

class _NaviBarScreenState extends State<NaviBarScreen> {
  int index = 0;

  List<Widget> ourWidgets = [
    const HomeScreen(),
    const AboutScreen(),
    const ProfileScreen(),
    const SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navBarController = Get.put(NavBarController(), permanent: false);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() => IndexedStack(
                  index: navBarController.tabIndex.value,
                  children: ourWidgets,
                )),
          ),
          SizedBox(
            height: size.height * 0.15,
            width: size.width,
            child: const OurCustomNavigationBar(),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   onTap: (newIndex) => setState(() {
      //     index = newIndex;
      //   }),
      //   currentIndex: index,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: const Icon(Icons.home),
      //       label: 'home'.tr,
      //       // activeIcon: Icon(workerNavigationLists[0].icon),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: const Icon(Icons.ac_unit_outlined),
      //       label: 'about'.tr,
      //       // activeIcon: Icon(workerNavigationLists[0].icon),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: const Icon(Icons.location_city),
      //       label: 'profile'.tr,
      //     ),
      //     BottomNavigationBarItem(
      //       icon: const Icon(Icons.settings),
      //       label: 'settings'.tr,
      //       // activeIcon: Icon(workerNavigationLists[0].icon),
      //     ),
      //   ],
      // ),
    );
  }
}

class OurCustomNavigationBar extends StatelessWidget {
  const OurCustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navBarController = Get.put(NavBarController(), permanent: false);
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 54,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: navBarController.changeTabIndex,
            currentIndex: navBarController.tabIndex.value,
            // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            unselectedItemColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.5),
            selectedItemColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelStyle: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            selectedLabelStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'home'.tr,
                // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.search,
                    size: 20.0,
                  ),
                ),
                label: 'profile'.tr,
                // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.location_history,
                    size: 20.0,
                  ),
                ),
                label: 'about'.tr,
                // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.settings,
                    size: 20.0,
                  ),
                ),
                label: 'settings'.tr,
                // backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
              ),
            ],
          ),
        )));
  }
}
