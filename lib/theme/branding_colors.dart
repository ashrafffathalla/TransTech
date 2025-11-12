import 'package:flutter/material.dart';

class TTColors {
  // Core brand
  static const orange = Color(0xFFFF7A00);
  static const orangeDeep = Color(0xFFE65F00);
  static const blue = Color(0xFF0E4682);

  // Neutrals
  static const bg = Color(0xFFF9FAFB);
  static const text = Color(0xFF1F2937);

  // Readable "on" colors
  static const onBlue = Colors.white;
  static const onOrange = Colors.white;

  // Gradients
  static const gradientOrange = LinearGradient(
    begin: Alignment.topLeft, end: Alignment.bottomRight,
    colors: [orange, orangeDeep],
  );

  static const gradientOrangeBlue = LinearGradient(
    begin: Alignment.topLeft, end: Alignment.bottomRight,
    colors: [orange, blue],
  );
}
