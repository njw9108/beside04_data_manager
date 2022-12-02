import 'package:flutter/cupertino.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 450;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 450&&
      MediaQuery.of(context).size.width < 950;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 950;
}
