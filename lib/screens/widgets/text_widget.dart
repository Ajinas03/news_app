import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  const TextWidget(
      {super.key,
      required this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.normal),
    );
  }
}
