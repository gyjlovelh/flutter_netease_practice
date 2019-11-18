

import 'package:flutter/material.dart';

class NeteaseGradientText extends StatelessWidget {
  final String title;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;

  NeteaseGradientText(this.title, {
    @required this.gradient,
    this.style,
    this.textAlign
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(
        "$title",
        textAlign: textAlign,
        style: (style == null) 
          ? TextStyle(color: Colors.white)
          : style.copyWith(color: Colors.white)
      ),
    );
  }
}