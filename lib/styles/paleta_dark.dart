import 'package:controle_pressao_arterial/styles/paleta_style.dart';
import 'package:flutter/material.dart';

class PaletteDark implements PaletaStyle {
  @override
  Color primary = const Color.fromRGBO(5, 94, 104, 1);

  @override
  Color accent = const Color.fromRGBO(130, 246, 157, 1);

  @override
  Color background = const Color.fromRGBO(44, 51, 51, 1);

  @override
  Color backgroundDark = Colors.grey[900]!;

  @override
  Color error = Colors.red;

  @override
  Color primaryDark = const Color.fromRGBO(98, 163, 136, 1);

  @override
  Color secondary = const Color.fromRGBO(28, 43, 45, 1);

  @override
  Color success = Colors.green[800]!;

  @override
  Color text = Colors.grey[50]!;

  @override
  Color textSecondary = Colors.white;

  @override
  Color warning = Colors.yellow[900]!;

  @override
  Color white = Colors.white;
}
