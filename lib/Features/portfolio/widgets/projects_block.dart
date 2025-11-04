import 'package:flutter/material.dart';
import '../../../theme/branding_colors.dart'; // TTColors

class ProjectsBlock extends StatelessWidget {
  const ProjectsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final w = c.maxWidth;
      final cols = w >= 1200 ? 4 : w >= 900 ? 3 : w >= 600 ? 2 : 1;

      //  Taller tiles to avoid overflow with Arabic/long text & badges
      final itemHeight =
      w >= 1200 ? 340 :
      w >= 900  ? 360 :
      w >= 600  ? 380 : 420;

      return GridView.builder(
        itemCount: _items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: w >= 1200 ? 16/5 : 16/8,

        ),
        itemBuilder: (context, i) {
          final p = _items[i];
          return _ProjectCard(
            title: p.title,
            description: p.description,
            badges: p.badges,
          );
        },
      );
    });
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> badges;
  final VoidCallback? onDetails;

  const _ProjectCard({
    required this.title,
    required this.description,
    this.badges = const [],
    this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    final shownBadges = badges.take(3).toList(); // // cap badges to 3

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Brand accent
            Container(height: 6, decoration: const BoxDecoration(gradient: TTColors.gradientOrange)),
            const SizedBox(height: 10),

            // Title
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w800, color: TTColors.blue),
            ),
            const SizedBox(height: 6),

            //  Clamp description
            Text(
              description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            if (shownBadges.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: shownBadges.map((b) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF2E6),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: TTColors.orange.withOpacity(.35)),
                  ),
                  child: Text(b, style: Theme.of(context).textTheme.bodySmall),
                )).toList(),
              ),
            ],

            const SizedBox(height: 12), //  replace Spacer with fixed gap

            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: onDetails ?? () {},
                style: TextButton.styleFrom(
                  foregroundColor: TTColors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                child: const Text('View details'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ------------ Demo data ------------ */

class _ProjectItem {
  final String title;
  final String description;
  final List<String> badges;
  const _ProjectItem(this.title, this.description, this.badges);
}

const _items = <_ProjectItem>[
  _ProjectItem(
    'Factory — 6th of October City',
    'Three-shift shuttle program covering 12 pickup hubs across Giza & Haram. '
        'Live ETAs shared with supervisors; geofencing for gate arrivals.',
    ['120 riders/day', '4 routes', 'SLA 99.1%'],
  ),
  _ProjectItem(
    'New Cairo BPO — Night Shifts',
    'Safe late-night transport for rotating teams; on-demand fallback for overtime and escalations.',
    ['80 riders/night', '3 fixed + on-demand', '24/7 Dispatch'],
  ),
  _ProjectItem(
    'Factory — 10th of Ramadan',
    'Loop service connecting multiple plants with synchronized shift windows; unified check-in QR.',
    ['96 riders/day', '5 routes + loop', 'SLA 98.9%'],
  ),
  _ProjectItem(
    'Factory — 10th of Ramadan',
    'Ad-hoc bookings with priority routing and driver assignment; digital receipts & monthly reports.',
    ['On-demand', 'Response < 20m', 'CSAT 4.8/5'],
  ),
  _ProjectItem(
    'Obour City',
    'Loop service connecting multiple plants with synchronized shift windows; unified check-in QR.',
    ['96 riders/day', '5 routes + loop', 'SLA 98.9%'],
  ),
];
