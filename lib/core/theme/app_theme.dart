import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor   = Color(0xFF667eea);
  static const Color _secondaryColor = Color(0xFF764ba2);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        secondary: _secondaryColor,
        brightness: Brightness.light,
      ),
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      appBarTheme: const AppBarTheme(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.3,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
      ),
      extensions: const [AppThemeExtension.light],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _primaryColor,
        secondary: _secondaryColor,
        brightness: Brightness.dark,
      ),
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: const Color(0xFF1A1A2E),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF16213E),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: const Color(0xFF16213E),
      ),
      extensions: const [AppThemeExtension.dark],
    );
  }
}

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color successColor;
  final Color errorColor;
  final Color cardBackground;

  const AppThemeExtension({
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.successColor,
    required this.errorColor,
    required this.cardBackground,
  });

  static const light = AppThemeExtension(
    textPrimaryColor: Color(0xFF1A1A2E),
    textSecondaryColor: Color(0xFF6B7280),
    successColor: Color(0xFF10B981),
    errorColor: Color(0xFFEF4444),
    cardBackground: Colors.white,
  );

  static const dark = AppThemeExtension(
    textPrimaryColor: Colors.white,
    textSecondaryColor: Color(0xFF9CA3AF),
    successColor: Color(0xFF10B981),
    errorColor: Color(0xFFEF4444),
    cardBackground: Color(0xFF16213E),
  );

  @override
  AppThemeExtension copyWith({
    Color? textPrimaryColor,
    Color? textSecondaryColor,
    Color? successColor,
    Color? errorColor,
    Color? cardBackground,
  }) {
    return AppThemeExtension(
      textPrimaryColor:   textPrimaryColor   ?? this.textPrimaryColor,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
      successColor:       successColor       ?? this.successColor,
      errorColor:         errorColor         ?? this.errorColor,
      cardBackground:     cardBackground     ?? this.cardBackground,
    );
  }

  @override
  AppThemeExtension lerp(AppThemeExtension? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      textPrimaryColor:   Color.lerp(textPrimaryColor,   other.textPrimaryColor,   t)!,
      textSecondaryColor: Color.lerp(textSecondaryColor, other.textSecondaryColor, t)!,
      successColor:       Color.lerp(successColor,       other.successColor,       t)!,
      errorColor:         Color.lerp(errorColor,         other.errorColor,         t)!,
      cardBackground:     Color.lerp(cardBackground,     other.cardBackground,     t)!,
    );
  }
}