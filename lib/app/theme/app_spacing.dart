import 'package:flutter/material.dart';

/// App spacing constants
class AppSpacing {
  AppSpacing._();
  
  // Base spacing unit
  static const double unit = 4.0;
  
  // Spacing values
  static const double xs = 4.0;   // unit * 1
  static const double sm = 8.0;   // unit * 2
  static const double md = 12.0;  // unit * 3
  static const double lg = 16.0;  // unit * 4
  static const double xl = 20.0;  // unit * 5
  static const double xxl = 24.0; // unit * 6
  static const double xxxl = 32.0; // unit * 8
  
  // Padding presets
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);
  static const EdgeInsets paddingXxl = EdgeInsets.all(xxl);
  
  // Horizontal padding
  static const EdgeInsets paddingHorizontalLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets paddingHorizontalXl = EdgeInsets.symmetric(horizontal: xl);
  
  // Vertical padding
  static const EdgeInsets paddingVerticalSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingVerticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingVerticalLg = EdgeInsets.symmetric(vertical: lg);
  
  // Screen padding
  static const EdgeInsets screenPadding = EdgeInsets.all(lg);
  static const EdgeInsets screenPaddingHorizontal = EdgeInsets.symmetric(horizontal: lg);
}
