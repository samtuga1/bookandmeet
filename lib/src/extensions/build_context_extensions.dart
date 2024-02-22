import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  /// Full height of the screen
  double get height => MediaQuery.sizeOf(this).height;

  /// Full height of the screen
  double get width => MediaQuery.sizeOf(this).width;
}
