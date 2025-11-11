import 'package:flutter/material.dart';
import '../../../theme/branding_colors.dart';

class AboutBlock extends StatelessWidget {
  const AboutBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      runSpacing: 16,
      children: const [
        _InfoCard(
          title: 'Who We Are',
          body:
          'TransTech delivers reliable employee transportation for companies, factories, and business parks. '
              'We connect people to work safely and on time using technology-driven planning and operations.',
          bullets: [
            'Coverage: 10th Of Ramadan,Cairo, Giza, 6th of October, New Cairo, Obour,Badr',
            '24/7 dispatch & on-ground supervisors',
            'Driver vetting, safety checks, incident logs',
          ],
        ),
        _InfoCard(
          title: 'What We Do',
          body:
          'Daily shuttle routes aligned to shift times, on-demand trips for OT/late nights, and event transport at scale. '
              'We manage route design, fleet coordination, and SLA reporting end-to-end.',
          bullets: [
            'Fixed routes & hub pick-ups',
            'On-demand/VIP movements',
            'Event & peak-hour deployments',
          ],
        ),
        _InfoCard(
          title: 'Technology & Operations',
          body:
          'We combine GPS tracking, smart route optimization, and live dashboards to deliver transparent, data-driven service.',
          bullets: [
            'Live ETAs, geofencing alerts, rider info',
            'Optimization by time windows & rider load',
            'SLA/attendance reports (CSV/PDF) & integrations',
          ],
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String body;
  final List<String>? bullets;

  const _InfoCard({
    required this.title,
    required this.body,
    this.bullets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 560),
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // subtle brand accent
            Container(height: 6, decoration: const BoxDecoration(gradient: TTColors.gradientOrange)),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w800, color: TTColors.blue)),
                  const SizedBox(height: 8),
                  Text(body, style: Theme.of(context).textTheme.bodyMedium),
                  if (bullets != null && bullets!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: bullets!
                          .map((b) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 3),
                              child: Icon(Icons.check_circle_outline,
                                  size: 16, color: TTColors.orange),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(b)),
                          ],
                        ),
                      ))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
