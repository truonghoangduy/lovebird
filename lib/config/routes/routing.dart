import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static const loginRoute = "/login";

  static const bioRoute = "/bio";
  static const findRoute = "/find";
  static const scanRoute = "/scan";

  static const matchRoute = "/match";
  static const splashRoute = "/splash";
  static const mainRoute = "/main";
}

class WidgetKey {
  static final GlobalKey<CurvedNavigationBarState> bottomNavigationKey =
      GlobalKey();
}
