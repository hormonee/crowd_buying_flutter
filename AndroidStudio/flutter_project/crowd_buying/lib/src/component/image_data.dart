import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  String iconPath;
  double width;

  ImageData(
    this.iconPath, {
    Key? key,
    this.width = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      iconPath,
      width: width / Get.mediaQuery.devicePixelRatio,
    );
  }
}

class IconsPath {
  static String get homeOff => 'assets/images/bottom_nav_home_off_icon.png';
  static String get homeOn => 'assets/images/bottom_nav_home_on_icon.png';
  static String get searchOff => 'assets/images/bottom_nav_search_off_icon.png';
  static String get searchOn => 'assets/images/bottom_nav_search_on_icon.png';
  static String get upload => 'assets/images/bottom_nav_upload_icon.png';
  static String get bookmarkOff => 'assets/images/bottom_nav_bookmark_off_icon.png';
  static String get bookmarkOn => 'assets/images/bottom_nav_bookmark_on_icon.png';
  static String get mypageOff => 'assets/images/bottom_nav_mypage_off_icon.png';
  static String get mypageOn => 'assets/images/bottom_nav_mypage_on_icon.png';
  static String get notification => 'assets/images/notification_icon.png';
  static String get crowdBuyingLogo => 'assets/images/crowd_buying_logo.png';
}
