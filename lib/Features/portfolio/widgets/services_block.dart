import 'package:flutter/material.dart';
import '../../../theme/branding_colors.dart';

class ServicesBlock extends StatelessWidget {
  const ServicesBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final w = c.maxWidth;
      final cols = w >= 1200 ? 3 : w >= 900 ? 3 : w >= 600 ? 2 : 1;

      return GridView.count(
        crossAxisCount: cols,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: w >= 1200 ? 16/6 : 16/8,
        children: const [
          _ServiceTile('Daily Shuttle Routes', 'Fixed pick-ups & drop-offs aligned to shift times.'),
          _ServiceTile('On-Demand Trips', 'Ad-hoc rides for OT, late nights, and VIPs.'),
          _ServiceTile('Fleet & Supervisors', 'Buses/minibuses/vans with trained drivers & on-ground leads.'),
          _ServiceTile('GPS Tracking & ETAs', 'Live bus locations, arrival ETAs, geofencing alerts.'),
          _ServiceTile('Smart Route Planning', 'Optimization by time windows, rider load, and traffic patterns.'),
          _ServiceTile('Reporting & SLA', 'Attendance, punctuality, and incident logs with monthly reports.'),
        ],
      );
    });
  }
}

class _ServiceTile extends StatelessWidget {
  final String title;
  final String desc;
  const _ServiceTile(this.title, this.desc);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.route, color: TTColors.orange),
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          subtitle: Text(desc),
        ),
      ),
    );
  }
}
