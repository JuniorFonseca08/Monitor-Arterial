import 'package:flutter/material.dart';

import 'app_bar_componente.dart';

class CorpoComponente extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BottomNavigationBar? bar;
  final FloatingActionButton? actionButton;
  final FloatingActionButtonLocation? actionLocation;

  const CorpoComponente({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.bar,
    this.actionButton,
    this.actionLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponente(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.topCenter,
        margin: margin ?? const EdgeInsets.only(top: 8),
        padding: padding ?? const EdgeInsets.all(18),
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: child,
      ),
      bottomNavigationBar: bar,
      floatingActionButton: actionButton,
      floatingActionButtonLocation: actionLocation,
    );
  }
}
