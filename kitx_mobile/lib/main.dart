// import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart' hide Intent;

import 'package:flutter_logs/flutter_logs.dart';
// import 'package:receive_intent/receive_intent.dart';
import 'package:get/get.dart';

import 'pages/home_page.dart';
import 'pages/device_page.dart';
import 'pages/test_page.dart';

import 'services/web_server.dart';

import 'utils/translation.dart';
import 'utils/config.dart';
import 'utils/global.dart' as global;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WebServer server = WebServer(Config.WebServer_UdpPortReceive, Config.WebServer_UdpPortSend, Config.WebServer_UdpBroadcastAddress);
  server.initServer();
  await FlutterLogs.initLogs(
    logLevelsEnabled: Config.Log_LogLevelsEnabled,
    timeStampFormat: Config.Log_TimeStampFormat,
    directoryStructure: Config.Log_DirectoryStructure,
    logTypesEnabled: Config.Log_LogTypesEnabled,
    logFileExtension: Config.Log_LogFileExtension,
    logsWriteDirectoryName: Config.Log_LogsWriteDirectoryName,
    logsExportDirectoryName: Config.Log_LogsExportDirectoryName,
    debugFileOperations: Config.Log_DebugFileOperations,
    isDebuggable: Config.Log_IsDebuggable,
  );
  global.devices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KitX Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      translations: Translation(),
      locale: ui.window.locale,
      fallbackLocale: Locale('en', 'US'),
      // supportedLocales: const [
      //   Locale("en", "US"),
      //   Locale("zh", "CN"),
      // ],
      getPages: [
        GetPage(
          name: "/",
          page: () => HomePage(),
        ),
        GetPage(
          name: "/DevicePage/",
          page: () => DevicePage(),
        ),
      ],
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    imageCache.clear();
    return Scaffold(
      appBar: AppBar(
        title: Text("IndexPage_Title".tr),
      ),
      drawer: Drawer(
          child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              // color: Colors.blue,
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage("assets/KitX-Background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              "Drawer_Title".tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Drawer_Home".tr),
            onTap: () {
              Get.back();
              Get.to(() => HomePage());
            },
          ),
          ListTile(
            leading: Icon(Icons.devices),
            title: Text("Drawer_Devices".tr),
            onTap: () {
              Get.back();
              Get.to(() => DevicePage());
            },
          ),
          ListTile(
            leading: Icon(Icons.alternate_email),
            title: Text("Drawer_Account".tr),
            onTap: () {
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.bug_report),
            title: Text("TestPage"),
            onTap: () {
              Get.back();
              Get.to(() => TestPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Drawer_Setting".tr),
            onTap: () {
              Get.back();
            },
          ),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "欢迎来到 KitX",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
