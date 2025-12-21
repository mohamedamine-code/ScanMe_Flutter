import 'package:flutter/material.dart';

class Titletext extends StatelessWidget {
  final String data;
  final double fontSize;
  final Color? color;
  final TextAlign textAlign;
  final int maxLines;
  final FontWeight fontWeight;

  const Titletext({
    super.key,
    required this.data,
    this.fontSize = 19,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines = 3,
    this.fontWeight = FontWeight.bold,
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
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? (isDark ? Colors.white : Colors.black87),
        letterSpacing: 0.3,
        height: 1.4,
      ),
    );
  }
}