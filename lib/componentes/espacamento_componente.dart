import 'package:flutter/material.dart';

class EspacamentoComponente extends StatelessWidget {
  final double size;
  final bool isFull;
  final bool isHorizontal;

  const EspacamentoComponente({
    Key? key,
    this.size = 16,
    this.isFull = false,
    this.isHorizontal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isFull == true) {
      return const Spacer();
    }
    return SizedBox(
      height: size,
      width: isHorizontal ? size : null,
    );
  }
}
