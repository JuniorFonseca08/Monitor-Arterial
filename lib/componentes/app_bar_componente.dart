import 'package:flutter/material.dart';

class AppBarComponente extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  const AppBarComponente({
    super.key,
    this.titulo = 'Controle Arterial',
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        titulo,
        textAlign: TextAlign.center,
      ),
    );
  }
}
