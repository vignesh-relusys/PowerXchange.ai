import 'package:flutter/material.dart';

class AppTheme {
  // Color palette for high-fidelity design
  static const Color primaryBlue = Color(0xFF3BB3FF);
  static const Color neonCyan = Color(0xFF2DD4FF); 
  static const Color darkBg = Color(0xFF070B14);
  static const Color cardBg = Color(0xFF0F172A);
  static const Color inputBg = Color(0xFF1A2332);
  static const Color textGray = Color(0xFF9CA3AF);

  // Gradient for primary login buttons
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1E40AF), Color(0xFF3BB3FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBg,
    fontFamily: 'Inter',

    colorScheme: const ColorScheme.dark(
      primary: primaryBlue,
      secondary: neonCyan,
      surface: cardBg,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black.withOpacity(0.3),
      hintStyle: const TextStyle(color: textGray, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryBlue, width: 1.5),
      ),
      prefixIconColor: textGray,
      suffixIconColor: textGray,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 14),
      ),
    ),
  );
}