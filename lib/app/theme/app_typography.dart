import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App typography styles
class AppTypography {
  AppTypography._();
  
  static TextStyle get _baseStyle => GoogleFonts.inter();
  
  // Display
  static TextStyle get displayLarge => _baseStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: -0.5,
  );
  
  static TextStyle get displayMedium => _baseStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: -0.25,
  );
  
  static TextStyle get displaySmall => _baseStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3,
  );
  
  // Heading
  static TextStyle get headingLarge => _baseStyle.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: -0.015,
  );
  
  static TextStyle get headingMedium => _baseStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 1.4,
    letterSpacing: -0.015,
  );
  
  static TextStyle get headingSmall => _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  // Body
  static TextStyle get bodyLarge => _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );
  
  static TextStyle get bodyMedium => _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );
  
  static TextStyle get bodySmall => _baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );
  
  // Label
  static TextStyle get labelLarge => _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static TextStyle get labelMedium => _baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
  
  static TextStyle get labelSmall => _baseStyle.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.5,
  );
  
  // Button
  static TextStyle get buttonLarge => _baseStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: 0.015,
  );
  
  static TextStyle get buttonMedium => _baseStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
  
  static TextStyle get buttonSmall => _baseStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.25,
  );
}
