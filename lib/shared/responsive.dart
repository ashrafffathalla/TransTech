import 'package:flutter/material.dart';

class R {
  static bool xs(BuildContext c) => MediaQuery.sizeOf(c).width < 360;
  static bool sm(BuildContext c) => MediaQuery.sizeOf(c).width < 600;
  static bool md(BuildContext c) => MediaQuery.sizeOf(c).width < 900;
  static bool lg(BuildContext c) => MediaQuery.sizeOf(c).width < 1200;
  static double hp(BuildContext c, double v) => v * MediaQuery.sizeOf(c).height / 812;
  static double wp(BuildContext c, double v) => v * MediaQuery.sizeOf(c).width / 375;
}
