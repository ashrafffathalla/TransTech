import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../theme/branding_colors.dart'; // TTColors

class HeroBlock extends StatelessWidget {
  final bool isWide;
  const HeroBlock({super.key, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final small = w < 600;

    final titleStyle = Theme.of(context).textTheme.displaySmall?.copyWith(
      fontWeight: FontWeight.w800,
      fontSize: small ? 28 : 36,
      height: 1.15,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Copy
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('TransTech: Technology-Powered Employee Transport', style: titleStyle),
              const SizedBox(height: 12),
              Text(
                'Smart routing, GPS tracking, and 24/7 ops to get your teams to work on time — every shift.',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(height: 1.35),
              ),
              const SizedBox(height: 16),
              if (small)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilledButton(
                      onPressed: () => launchUrl(Uri.parse('tel:+201234567890')),
                      child: const Text('Call for Quote'),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () => launchUrl(Uri.parse('https://wa.me/201234567890')),
                      child: const Text('WhatsApp Us'),
                    ),
                  ],
                )
              else
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    FilledButton(
                      onPressed: () => launchUrl(Uri.parse('tel:+201234567890')),
                      child: const Text('Call for Quote'),
                    ),
                    OutlinedButton(
                      onPressed: () => launchUrl(Uri.parse('https://wa.me/201234567890')),
                      child: const Text('WhatsApp Us'),
                    ),
                    TextButton(
                      onPressed: () => launchUrl(Uri.parse('mailto:contact@transtech.com')),
                      child: const Text('Email'),
                    ),
                  ],
                ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        //  Always show the visual; size it by breakpoint
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: small ? 160 : 320, // shorter on mobile
            decoration: const BoxDecoration(
              gradient: TTColors.gradientOrangeBlue,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  'Smart Routing • GPS Tracking • Live ETAs • 24/7 Ops',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: small ? 16 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
