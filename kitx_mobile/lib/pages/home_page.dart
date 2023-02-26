﻿import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'device_page.dart';
import 'account_page.dart';
import 'test_page.dart';
import 'settings_page.dart';
import 'about_page.dart';

import '../utils/global.dart';

import "controls/devices_status.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final version = "getting ...".obs;
  final pageOpenDelay = 200;

  @override
  Widget build(BuildContext context) {
    var packageInfo = PackageInfo.fromPlatform();
    packageInfo.then((value) => version.value = value.version);

    // imageCache.clear(); // 清除图片缓存
    var tileRadius =
        ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10.0));
    var tilesPadding = 15.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("IndexPage_Title".tr),
      ),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width / 2 + 50,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                // color: Colors.blue,
                image: const DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("assets/KitX-Background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                "",
                // "Drawer_Title".tr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.devices),
              title: Text("Drawer_Devices".tr),
              onTap: () => Global.delay(() {
                Get.back();
                Get.to(() => DevicePage());
              }, pageOpenDelay),
            ),
            ListTile(
              leading: Icon(Icons.alternate_email),
              title: Text("Drawer_Account".tr),
              onTap: () => Global.delay(() {
                Get.back();
                Get.to(() => AccountPage());
              }, pageOpenDelay),
            ),
            ListTile(
              leading: Icon(Icons.bug_report),
              title: Text("Drawer_Test".tr),
              onTap: () => Global.delay(() {
                Get.back();
                Get.to(() => TestPage());
              }, pageOpenDelay),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Drawer_Setting".tr),
              onTap: () => Global.delay(() {
                Get.back();
                Get.to(() => SettingsPage());
              }, pageOpenDelay),
            ),
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text("Drawer_About".tr),
              onTap: () => Global.delay(() {
                Get.back();
                Get.to(() => AboutPage());
              }, pageOpenDelay),
            ),
          ],
        ),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(height: tilesPadding),
                Obx(
                  () => ListTile(
                    leading: Icon(Icons.devices),
                    title: Text("Drawer_Devices".tr),
                    subtitle: Text("${Global.devices.length.obs} " +
                        "HomePage_DevicesCount".tr),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    shape: tileRadius,
                    // tileColor: Colors.indigo,
                    // textColor: Colors.white,
                    // iconColor: Colors.white,
                    onTap: () => Global.delay(
                        () => Get.to(() => DevicePage()), pageOpenDelay),
                  ),
                ),
                Container(height: tilesPadding),
                ListTile(
                  leading: Icon(Icons.alternate_email),
                  title: Text("Drawer_Account".tr),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  shape: tileRadius,
                  onTap: () => Global.delay(
                      () => Get.to(() => AccountPage()), pageOpenDelay),
                ),
                Container(height: tilesPadding),
                ListTile(
                  leading: Icon(Icons.bug_report),
                  title: Text("Drawer_Test".tr),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  shape: tileRadius,
                  onTap: () => Global.delay(
                      () => Get.to(() => TestPage()), pageOpenDelay),
                ),
                Container(height: tilesPadding),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Drawer_Setting".tr),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  shape: tileRadius,
                  onTap: () => Global.delay(
                      () => Get.to(() => SettingsPage()), pageOpenDelay),
                ),
                Container(height: tilesPadding),
                Obx(
                  () => ListTile(
                    leading: Icon(Icons.info_outline_rounded),
                    title: Text("Drawer_About".tr),
                    subtitle: Text(version.value),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    shape: tileRadius,
                    onTap: () => Global.delay(
                        () => Get.to(() => AboutPage()), pageOpenDelay),
                  ),
                ),
                Container(height: tilesPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
