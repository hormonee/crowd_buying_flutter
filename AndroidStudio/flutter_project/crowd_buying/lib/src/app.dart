import 'package:crowd_buying/src/controller/bottom_nav_controller.dart';
import 'package:crowd_buying/src/view/community.dart';
import 'package:crowd_buying/src/view/home.dart';
import 'package:crowd_buying/src/view/mypage.dart';
import 'package:crowd_buying/src/view/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/image_data.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: Obx(
              () => Scaffold(
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                const Home(),
                Navigator(
                  key: controller.searchPageNavigationKey,
                  onGenerateRoute: (routeSetting) {
                    return MaterialPageRoute(
                      builder: (context) => const Search(),
                    );
                  },
                ),
                Container(),
                const Community(),
                const MyPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
              elevation: 0,
              onTap: controller.changeBottomNav,
              items: [
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.homeOff),
                  activeIcon: ImageData(IconsPath.homeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.searchOff),
                  activeIcon: ImageData(IconsPath.searchOn),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.upload),
                  label: 'upload',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.bookmarkOff),
                  activeIcon: ImageData(IconsPath.bookmarkOn),
                  label: 'interest',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.mypageOff),
                  activeIcon: ImageData(IconsPath.mypageOn),
                  label: 'profile',
                ),
              ],
            ),
          ),
        ),
        onPopInvoked: (bool didPop) {
          controller.onPopAction;
        });
  }
}
