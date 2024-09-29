// Widget para título Principal

import 'package:flutter/material.dart';

class H1 extends StatelessWidget {
  const H1(this.text, {super.key, this.color, required String fontFamily});

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: color,
          ),
    );
  }
}
