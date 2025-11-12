import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../theme/branding_colors.dart';

class ContactBlock extends StatelessWidget {
  const ContactBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isPhone = w < 600;

    return
      Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          // Gradient header strip (subtle brand accent)
          Container(
            height: 6,
            decoration: const BoxDecoration(gradient: TTColors.gradientOrange),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon tile
                Container(
                  decoration: BoxDecoration(
                    gradient: TTColors.gradientOrangeBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(Icons.support_agent, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                // Titles
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Let’s work together',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w800, color: TTColors.blue)),
                      const SizedBox(height: 6),
                      Text(
                        'Tell us pickup zones, shift times, rider count, and any special needs. '
                            'We’ll propose routes & a quote within 1 business day.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Quick “badges” / selling points
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                _Badge(label: 'SLA ≥ 98% on-time'),
                _Badge(label: '24/7 Dispatch'),
                _Badge(label: 'GPS Tracking'),
                _Badge(label: 'Monthly Reports'),
              ],
            ),
          ),

          const Divider(height: 20),

          // CTAs
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: isPhone
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:  [
                _PrimaryCTA(
                  icon: Icons.call,
                  label: 'Call +20 109 674 5251',
                  url: 'tel:+201096745251',
                ),
                SizedBox(height: 10),
              _SecondaryCTA(
                icon: const FaIcon(FontAwesomeIcons.whatsapp, color: TTColors.orange, size: 18),
                label: 'WhatsApp',
                url: 'https://wa.me/201234567890',
              ),
                SizedBox(height: 10),
                _GhostCTA(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  url: 'mailto:contact@transtech.com',
                ),
              ],
            )
                : Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                const _PrimaryCTA(
                  icon: Icons.call,
                  label: 'Call +20 109 674 5251',
                  url: 'tel:+201096745251',
                ),
                _SecondaryCTA(
                  icon:  FaIcon(FontAwesomeIcons.whatsapp, color: TTColors.orange, size: 18),
                  label: 'WhatsApp',
                  url: 'https://wa.me/201234567890',
                ),
                const _GhostCTA(
                  icon: Icons.email_outlined,
                  label: 'Email',
                  url: 'mailto:contact@transtech.com',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------- Sub-widgets ---------- */

class _Badge extends StatelessWidget {
  final String label;
  const _Badge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2E6), // soft orange background
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: TTColors.orange.withOpacity(.35)),
      ),
      child: Text(label, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}

class _PrimaryCTA extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  const _PrimaryCTA({required this.icon, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: FilledButton.styleFrom(
        backgroundColor: TTColors.blue,
        foregroundColor: TTColors.onBlue,
        minimumSize: const Size(180, 44),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
class _SecondaryCTA extends StatelessWidget {
  final Widget icon;       // ← Widget, not IconData
  final String label;
  final String url;
  const _SecondaryCTA({required this.icon, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: icon,                                // ← use directly
      label: Text(label),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: TTColors.orange, width: 1.2),
        foregroundColor: TTColors.orange,
        minimumSize: const Size(160, 44),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}


class _GhostCTA extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;
  const _GhostCTA({required this.icon, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: Icon(icon, size: 18, color: TTColors.blue),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: TTColors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
