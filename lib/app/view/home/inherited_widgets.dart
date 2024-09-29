//Widgets heredados

import 'package:flutter/material.dart';

class SpecialColor extends InheritedWidget {
  const SpecialColor({super.key, required super.child, required this.color});

  final Color color;

  static SpecialColor of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<SpecialColor>();
    if (result == null) throw Exception('El color especial no fue encontrado');
    return result;
  }

  @override
  bool updateShouldNotify(SpecialColor oldWidget) {
    return oldWidget.color != color;
  }
}
