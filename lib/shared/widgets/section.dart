// lib/shared/widgets/section.dart
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  final double maxContentWidth;
  const Section({
    super.key,
    required this.padding,
    required this.child,
    this.maxContentWidth = 1200, // <= cap on desktop
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isPhone = size.width < 480;
    final minH = size.height * (isPhone ? 0.70 : 0.85);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: minH.clamp(360, 680)),
      padding: padding,
      child: Center( // center on big screens
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: child,
        ),
      ),
    );
  }
}
