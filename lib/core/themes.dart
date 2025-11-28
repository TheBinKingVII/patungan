import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Palette - Blue-Green Gradient Theme
  static const Color primaryColor = Color(0xFF19385B); // Blue primary
  static const Color secondaryColor = Color(0xFFE08750); // Green secondary
  static const Color accentColor = Color(0xFFAA2F6A); // Light blue accent
  static const Color errorColor = Color(0xFFB00020);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFF7FAFC); // Light background
  static const Color textColor = Color(0xFF1A1A1A); // Dark text

  // Dark Mode Colors
  static const Color darkBackgroundColor = Color(
    0xFF0F172A,
  ); // Navy dark background
  static const Color darkPrimaryColor = Color(0xFF38BDF8); // Neon blue primary
  static const Color darkSecondaryColor = Color(
    0xFF22C55E,
  ); // Bright green secondary
  static const Color darkSurfaceColor = Color(0xFF1E293B); // Dark surface
  static const Color darkTextColor = Color(0xFFE2E8F0); // Light text

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: accentColor,
      surface: surfaceColor,
      background: backgroundColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textColor,
      onBackground: textColor,
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      centerTitle: true,
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 10),

      // Border default
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Color(0xFF000000)),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Color(0x7F19385B), width: 1),
      ),

      // Border saat fokus
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Color(0xFFAA2F6A), width: 2),
      ),

      // Border saat error
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Color(0xFFE63E6E), width: 1),
      ),
    ),

    cardTheme: const CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),

    textTheme: GoogleFonts.montserratTextTheme()
        .copyWith(
          displayLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
          displayMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w400),
          displaySmall: GoogleFonts.montserrat(fontWeight: FontWeight.w400),

          headlineLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w800),
          headlineMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w800),
          headlineSmall: GoogleFonts.montserrat(fontWeight: FontWeight.w700),

          titleLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          titleMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          titleSmall: GoogleFonts.montserrat(fontWeight: FontWeight.w700),

          bodyLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          bodyMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          bodySmall: GoogleFonts.montserrat(fontWeight: FontWeight.w600),

          labelLarge: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          labelMedium: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
          labelSmall: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        )
        .apply(bodyColor: Colors.black87, displayColor: Colors.black),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    colorScheme: const ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      tertiary: accentColor,
      surface: darkSurfaceColor,
      background: darkBackgroundColor,
      error: errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: darkTextColor,
      onBackground: darkTextColor,
      onError: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: darkSurfaceColor,
      foregroundColor: darkTextColor,
      centerTitle: true,
      titleTextStyle: GoogleFonts.montserrat(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkPrimaryColor,
        foregroundColor: Colors.white,
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkSurfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade700),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: darkPrimaryColor),
      ),
      labelStyle: GoogleFonts.montserrat(
        fontSize: 14,
        color: darkTextColor.withOpacity(0.7),
      ),
      hintStyle: GoogleFonts.montserrat(
        fontSize: 14,
        color: darkTextColor.withOpacity(0.5),
      ),
    ),
    cardTheme: const CardThemeData(
      elevation: 2,
      color: darkSurfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
    textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)
        .copyWith(
          displayLarge: GoogleFonts.montserrat(
            fontSize: 57,
            fontWeight: FontWeight.w400,
            color: darkTextColor,
          ),
          displayMedium: GoogleFonts.montserrat(
            fontSize: 45,
            fontWeight: FontWeight.w400,
            color: darkTextColor,
          ),
          displaySmall: GoogleFonts.montserrat(
            fontSize: 36,
            fontWeight: FontWeight.w400,
            color: darkTextColor,
          ),
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: darkTextColor,
          ),
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: darkTextColor,
          ),
          headlineSmall: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: darkTextColor,
          ),
          titleLarge: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
          titleSmall: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: darkTextColor,
          ),
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: darkTextColor,
          ),
          bodySmall: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: darkTextColor,
          ),
          labelLarge: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
          labelMedium: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
          labelSmall: GoogleFonts.montserrat(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: darkTextColor,
          ),
        ),
  );
}
