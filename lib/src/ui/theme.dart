import 'package:flutter/material.dart';
import 'package:tif_assignment/src/ui/ui.dart';

const _appFontFamily = 'Inter';
const _appAppBarColor = Colors.white;
const _appBackgroundColor = Colors.white;
const _appColorSchemeSeed = Colors.white;
const _appPrimaryColor = Color(0xFF5669FF);
final _appPrimaryColorAccent = const Color(0xFF5669FF).withOpacity(0.1);
const _appTextColor = Color(0xFF120D26);
const _appSecondaryTextColor = Color(0xFF747688);

const _appBorderRadius = BorderRadius.all(Radius.circular(10));

final _appPrimaryLinearGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.white.withOpacity(0.0),
    Colors.white,
  ],
);

ThemeData generateAppTheme() {
  return ThemeData(
    fontFamily: _appFontFamily,
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: _appBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: _appAppBarColor,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: _appColorSchemeSeed,
    ),
    extensions: [
      AppTheme(
        appBarColor: _appAppBarColor,
        backgroundColor: _appBackgroundColor,
        primaryColor: _appPrimaryColor,
        primaryColorAccent: _appPrimaryColorAccent,
        appBorderRadius: _appBorderRadius,
        appLinearGradient: _appPrimaryLinearGradient,
        textStyles: const TextStyles(
          color: _appTextColor,
          primaryColor: _appPrimaryColor,
          secondaryColor: _appSecondaryTextColor,
        ),
        appPaddings: const Paddings(),
        appSpacings: const Spacings(),
      ),
    ],
  );
}

class AppTheme extends ThemeExtension<AppTheme> {
  const AppTheme({
    required this.appBarColor,
    required this.backgroundColor,
    required this.primaryColor,
    required this.primaryColorAccent,
    required this.textStyles,
    required this.appBorderRadius,
    required this.appLinearGradient,
    required this.appPaddings,
    required this.appSpacings,
  });

  final Color appBarColor;
  final Color backgroundColor;
  final Color primaryColor;
  final Color primaryColorAccent;
  final TextStyles textStyles;
  final BorderRadius appBorderRadius;
  final LinearGradient appLinearGradient;
  final Paddings appPaddings;
  final Spacings appSpacings;

  static AppTheme of(BuildContext context) {
    return Theme.of(context).extension<AppTheme>()!;
  }

  @override
  ThemeExtension<AppTheme> copyWith({
    Color? appBarColor,
    Color? backgroundColor,
    Color? primaryColor,
    Color? primaryColorAccent,
    TextStyles? textStyles,
    BorderRadius? appBorderRadius,
    LinearGradient? appLinearGradient,
    Paddings? appPaddings,
    Spacings? appSpacings,
  }) {
    return AppTheme(
      appBarColor: appBarColor ?? this.appBarColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColorAccent: primaryColorAccent ?? this.primaryColorAccent,
      textStyles: textStyles ?? this.textStyles,
      appBorderRadius: appBorderRadius ?? this.appBorderRadius,
      appLinearGradient: appLinearGradient ?? this.appLinearGradient,
      appPaddings: appPaddings ?? this.appPaddings,
      appSpacings: appSpacings ?? this.appSpacings,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(covariant AppTheme other, double t) {
    return AppTheme(
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      primaryColorAccent:
          Color.lerp(primaryColorAccent, other.primaryColorAccent, t)!,
      textStyles: textStyles,
      appBorderRadius:
          BorderRadius.lerp(appBorderRadius, other.appBorderRadius, t)!,
      appLinearGradient:
          LinearGradient.lerp(appLinearGradient, other.appLinearGradient, t)!,
      appPaddings: appPaddings,
      appSpacings: appSpacings,
    );
  }
}
