import 'package:flutter/material.dart';

class AppNav {
  AppNav appNav = AppNav();

  void pagePush(BuildContext context, Widget page) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void gotoBannedAppPage(BuildContext context, Widget page) =>
      pagePush(context, page);
  void gotoOpenAppPage(BuildContext context, Widget page) => print("object");

  void gotoInterstitialPage() => print("object");
  void gotoInterstitialVideoPage() => print("object");
  void gotoRewardedPage() => print("object");
  void gotoRewardedInterstitialPage() => print("object");
  void gotoNativeAdvancedPage() => print("object");
  void gotoNativeAdvancedVideoPage() => print("object");
}
