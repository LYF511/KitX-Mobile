import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'test_pages/device_info_test.dart';
import 'test_pages/device_sensors.dart';
import 'test_pages/network_info_test.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text("TestPage_Title".tr),
            pinned: true,
            snap: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              controller: _tabController,
              tabs: <Tab>[
                Tab(
                  text: "Device Info",
                  icon: Icon(Icons.devices),
                ),
                Tab(
                  text: "Device Sensors",
                  icon: Icon(Icons.sensors),
                ),
                Tab(
                  text: "Network Info",
                  icon: Icon(Icons.wifi),
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            DeviceInfoTestPage(),
            DeviceSensorsPage(),
            NetworkInfoTestPage(),
          ],
        ),
      ),
    );
  }
}
