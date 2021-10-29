import 'package:flutter/material.dart';

class NavigatorKey {
  static final navigatorKey = new GlobalKey<NavigatorState>(debugLabel: "navigator");
  static final dropDownKey = new GlobalKey(debugLabel: "dropDown");
}
