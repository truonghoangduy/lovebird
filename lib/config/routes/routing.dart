import 'package:flutter/material.dart';

class AppRouting {
  static const loginRoute = "/login";

  static const bioRoute = "/bio";
  static const findRoute = "/find";
  static const scanRoute = "/scan";

  static const matchRoute = "/match";
  static const splashRoute = "/splash";
}

class WidgetKey {
  static final navigationKey = GlobalKey<NavigatorState>();
}
