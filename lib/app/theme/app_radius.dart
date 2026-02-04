import 'package:flutter/material.dart';

/// App radius constants
class AppRadius {
  AppRadius._();
  
  // Radius values
  static const double xs = 4.0;
  static const double sm = 6.0;
  static const double md = 8.0;
  static const double lg = 10.0;
  static const double xl = 12.0;
  static const double xxl = 16.0;
  static const double full = 9999.0;
  
  // BorderRadius presets
  static const BorderRadius borderRadiusXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius borderRadiusSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius borderRadiusMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius borderRadiusLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius borderRadiusXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius borderRadiusXxl = BorderRadius.all(Radius.circular(xxl));
  static const BorderRadius borderRadiusFull = BorderRadius.all(Radius.circular(full));
}

/// App shadow presets
class AppShadows {
  AppShadows._();
  
  static List<BoxShadow> get sm => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 13),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];
  
  static List<BoxShadow> get md => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 20),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];
  
  static List<BoxShadow> get lg => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 26),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];
  
  static List<BoxShadow> get xl => [
    BoxShadow(
      color: Colors.black.withValues(alpha: 31),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];
}
