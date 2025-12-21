import 'package:flutter/material.dart';

class Subtitletext extends StatelessWidget {
  final String data;
  final double fontSize;
  final Color? color;
  final TextAlign textAlign;
  final int maxLines;
  final FontWeight fontWeight;

  const Subtitletext({
    super.key,
    required this.data,
    this.fontSize = 15,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines = 2,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color ?? (isDark ? Colors.grey.shade300 : Color.fromARGB(255, 80, 80, 80)),
        letterSpacing: 0.2,
        height: 1.3,
      ),
    );
  }
}