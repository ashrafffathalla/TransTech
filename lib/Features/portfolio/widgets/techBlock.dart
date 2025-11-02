import 'package:flutter/material.dart';
import '../../../theme/branding_colors.dart';

class TechBlock extends StatelessWidget {
  const TechBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final w = c.maxWidth;
      final cols = w >= 1100 ? 3 : w >= 760 ? 2 : 1;

      return GridView.count(
        crossAxisCount: cols,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 16/9,
        children: const [
          _TechCard(
            title: 'Rider App / Web',
            text: 'See bus ETAs, live location, stop info, and shift schedules. Optional check-in QR.',
            icon: Icons.directions_bus_filled_outlined,
          ),
          _TechCard(
            title: 'Dispatcher Dashboard',
            text: 'Live map, route health, delays, incidents, and driver communication in one place.',
            icon: Icons.map_outlined,
          ),
          _TechCard(
            title: 'Optimization Engine',
            text: 'Automatic route builds using stops, rider loads, and time-window constraints.',
            icon: Icons.auto_mode_outlined,
          ),
          _TechCard(
            title: 'Telematics & Safety',
            text: 'Geofencing, harsh-braking alerts, speed compliance, and maintenance reminders.',
            icon: Icons.speed_outlined,
          ),
          _TechCard(
            title: 'SLA & Reports',
            text: 'On-time %, attendance, incident logs, and monthly CSV/PDF exports.',
            icon: Icons.insights_outlined,
          ),
          _TechCard(
            title: 'Integrations',
            text: 'HRIS / shift rosters import and single-sign-on (SSO) options.',
            icon: Icons.link_outlined,
          ),
        ],
      );
    });
  }
}

class _TechCard extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  const _TechCard({required this.title, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
              decoration: BoxDecoration(
                gradient: TTColors.gradientOrange,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w700))),
          ]),
          const SizedBox(height: 8),
          Text(text),
        ]),
      ),
    );
  }
}
