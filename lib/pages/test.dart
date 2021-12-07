import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' show Platform;
// import 'package:flutter/services.dart';
// import 'package:beacons_plugin/beacons_plugin.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [FloatingActionButton(onPressed: () async => {})],
      ),
    );
  }
}
