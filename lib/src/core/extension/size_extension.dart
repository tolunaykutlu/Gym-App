import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  double get deviceHeight => MediaQuery.of(this).size.height;
  double get deviceWidth => MediaQuery.of(this).size.width;
  Size get deviceSize => MediaQuery.of(this).size;
}
