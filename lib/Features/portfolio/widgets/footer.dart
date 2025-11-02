import 'package:flutter/material.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // or your bg color
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      alignment: Alignment.center,
      child: Text(
        '© ${DateTime.now().year} TransTech • Technology-Powered Employee Transport • Cairo & Giza',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black87),
        textAlign: TextAlign.center,
      ),
    );
  }
}

