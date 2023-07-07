import 'package:controle_pressao_arterial/styles/paleta_style.dart';
import 'package:flutter/material.dart';

class PaletteLight implements PaletaStyle {
  @override
  Color primary = Color.fromRGBO(187, 214, 184, 1);

  @override
  Color accent = Color.fromRGBO(160, 196, 157, 1);

  @override
  Color background = Color.fromRGBO(174, 194, 182, 0.63);

  @override
  Color backgroundDark = Color.fromRGBO(193, 215, 153, 1);

  @override
  Color error = Colors.red;

  @override
  Color primaryDark = const Color.fromRGBO(148, 175, 159, 1);

  @override
  Color secondary = Color.fromRGBO(219, 228, 198, 1);

  @override
  Color success = Colors.green;

  @override
  Color text = Colors.black87;

  @override
  Color textSecondary = Colors.black;

  @override
  Color warning = Colors.yellow[700]!;

  @override
  Color white = Colors.white;
}
