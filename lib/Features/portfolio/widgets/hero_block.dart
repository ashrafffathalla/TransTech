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
      fontSize: small ? 26 : 36,
      height: 1.15,
      color: Colors.white,
      shadows: const [Shadow(blurRadius: 8, offset: Offset(0, 2), color: Colors.black45)],
    );

    final bodyStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      height: 1.35,
      color: Colors.white.withOpacity(0.95),
      shadows: const [Shadow(blurRadius: 6, offset: Offset(0, 1), color: Colors.black38)],
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          // 1) Your original gradient
          Container(
            height: small ? 400 : 420,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: TTColors.gradientOrangeBlue,
            ),
          ),
          // 2) Dark scrim to guarantee contrast on any gradient
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.42)),
          ),

          // (optional) soft blobs can stay; if still noisy, comment them out
          // Positioned(right: -40, top: -30, child: _Blob(140)),
          // Positioned(left: -30, bottom: -20, child: _Blob(110)),

          // 3) Foreground content
          Padding(
            padding: EdgeInsets.fromLTRB(16, small ? 18 : 28, 16, small ? 18 : 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Kicker(text: 'Enterprise Employee Transport'),
                const SizedBox(height: 10),

                Text('TransTech: Technology-Powered\nEmployee Transport', style: titleStyle),
                const SizedBox(height: 8),

                Text(
                  'Smart routing, GPS tracking, and 24/7 ops to get your teams to work on time — every shift.',
                  style: bodyStyle,
                ),
                const SizedBox(height: 12),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: const [
                    _Pill('Smart Routing'),
                    _Pill('GPS Tracking'),
                    _Pill('Live ETAs'),
                    _Pill('24/7 Ops'),
                    _Pill('Incident Handling'),
                  ],
                ),
                const SizedBox(height: 14),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    // Higher-contrast primary CTA
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        elevation: 1,
                        padding: EdgeInsets.symmetric(horizontal: small ? 14 : 18, vertical: small ? 10 : 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () => _open('https://cal.com/'),
                      child: const Text('Book a Demo', style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    // Outlined but with semi-opaque fill for readability
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white.withOpacity(0.7)),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.08),
                        padding: EdgeInsets.symmetric(horizontal: small ? 14 : 18, vertical: small ? 10 : 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () => _open('mailto:sales@transtech.example'),
                      child: const Text('Talk to Sales'),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Stats card with a bit more opacity
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(small ? 12 : 14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.16),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.white.withOpacity(0.22)),
                  ),
                  child: Row(
                    mainAxisAlignment: small ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
                    children: const [
                      _HeroStat(value: '99.95%', label: 'Uptime'),
                      SizedBox(width: 16),
                      _HeroStat(value: '85%', label: 'Late trips ↓'),
                      SizedBox(width: 16),
                      _HeroStat(value: '50k+', label: 'Daily rides'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _Kicker extends StatelessWidget {
  final String text;
  const _Kicker({required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.28)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
          shadows: const [Shadow(blurRadius: 6, offset: Offset(0, 1), color: Colors.black38)],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  const _Pill(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14), // a bit more opaque
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.30)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: Colors.black.withOpacity(0.9), // darker for max readability
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;
  const _HeroStat({required this.value, required this.label});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              shadows: const [Shadow(blurRadius: 8, offset: Offset(0, 2), color: Colors.black45)],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Colors.white.withOpacity(0.95),
              shadows: const [Shadow(blurRadius: 6, offset: Offset(0, 1), color: Colors.black38)],
            ),
          ),
        ],
      ),
    );
  }
}
