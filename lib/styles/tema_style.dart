import 'package:controle_pressao_arterial/styles/paleta_dark.dart';
import 'package:controle_pressao_arterial/styles/paleta_light.dart';
import 'package:flutter/material.dart';

class MyThemest {
  static final PaletteLight _light = PaletteLight();
  static final PaletteDark _dark = PaletteDark();

  static final ThemeData claro = ThemeData.light().copyWith(
    colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: _light.primaryDark,
          secondary: _light.primary,
          background: _light.background,
          error: _light.error,
        ),
    primaryColor: _light.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _light.primaryDark,
      titleTextStyle: TextStyle(
        color: _light.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    scaffoldBackgroundColor: _light.background,
    cardTheme: CardTheme(color: _light.primary, shadowColor: _light.accent),
    primaryColorDark: _light.primaryDark,
    dialogBackgroundColor: _light.secondary,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => _light.primary),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? _light.primary
            : _light.primaryDark;
      }),
      trackColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? _light.primaryDark
            : _light.background;
      }),
    ),
  );

  static final ThemeData escuro = ThemeData.dark().copyWith(
    colorScheme: ThemeData.dark().colorScheme.copyWith(
          primary: _dark.primaryDark,
          secondary: _dark.primary,
          background: _dark.background,
          error: _dark.error,
        ),
    primaryColor: _dark.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _dark.primaryDark,
      titleTextStyle: TextStyle(
        color: _dark.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    scaffoldBackgroundColor: _dark.background,
    cardTheme: CardTheme(color: _dark.primary, shadowColor: _dark.accent),
    primaryColorDark: _dark.primaryDark,
    dialogBackgroundColor: _dark.secondary,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => _dark.primary),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? _dark.primary
            : _dark.primaryDark;
      }),
      trackColor: MaterialStateColor.resolveWith((states) {
        return states.contains(MaterialState.selected)
            ? _dark.primaryDark
            : _dark.background;
      }),
    ),
  );
}
