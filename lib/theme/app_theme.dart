import 'package:flutter/material.dart';

class AppTheme {
  // 1. Core Color Palette
  static const Color primaryBlue = Color(0xFF3BB3FF);
  static const Color neonCyan = Color(0xFF2DD4FF); 
  static const Color darkBg = Color(0xFF070B14);
  static const Color cardBg = Color(0xFF0F172A);
  static const Color inputBg = Color(0xFF1A2332);
  static const Color textGray = Color(0xFF9CA3AF);
  
  // High-fidelity accent colors
  static const Color borderGlow = Color(0xFF2DD4FF); 
  static const Color errorRed = Color(0xFFFF5252);

  // 2. Gradients for UI Elements
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1E40AF), Color(0xFF3BB3FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBg,
    fontFamily: 'Inter',

    // 3. ColorScheme Configuration
    colorScheme: const ColorScheme.dark(
      primary: primaryBlue,
      secondary: neonCyan,
      surface: cardBg,
      onSurface: Colors.white,
      error: errorRed,
    ),

    // 4. Input Decoration Theme (Used by TextFields)
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.black.withOpacity(0.3),
      hintStyle: const TextStyle(color: textGray, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      prefixIconColor: textGray,
      suffixIconColor: textGray,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryBlue, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: errorRed, width: 1),
      ),
    ),

    // 5. Navigation Rail Theme (For Dashboard Sidebar)
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: cardBg,
      selectedIconTheme: IconThemeData(color: neonCyan, size: 28),
      unselectedIconTheme: IconThemeData(color: textGray, size: 24),
      selectedLabelTextStyle: TextStyle(color: neonCyan, fontWeight: FontWeight.bold, fontSize: 12),
      unselectedLabelTextStyle: TextStyle(color: textGray, fontSize: 12),
      indicatorColor: Colors.transparent,
    ),

    // 6. Data Table Theme (For RFP/Tender Lists)
    dataTableTheme: DataTableThemeData(
      headingTextStyle: const TextStyle(
        color: neonCyan, 
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      dataTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
      headingRowColor: WidgetStateProperty.all(Colors.white.withOpacity(0.05)),
      dividerThickness: 1,
      horizontalMargin: 20,
    ),

    // 7. Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryBlue,
        padding: const EdgeInsets.symmetric(vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),

    // 8. Typography
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: textGray),
    ),
  );
}