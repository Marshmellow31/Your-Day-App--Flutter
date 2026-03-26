import 'package:flutter/material.dart';
import '../widgets/base_widgets.dart';
import '../widgets/app_bar.dart';
import '../theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Your Day'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Good morning, Alex.',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 48,
                    height: 1.1,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'You have a clear focus today. 8 of 12 tasks are already complete.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.mutedText,
                  ),
            ),
            const SizedBox(height: 48),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: const [
                StatTile(label: 'Tasks Done', value: '8 / 12'),
                StatTile(label: 'Success Rate', value: '66%'),
                StatTile(label: 'Daily Streak', value: '5', subValue: 'days'),
                StatTile(label: 'Overdue', value: '2'),
              ],
            ),
            const SizedBox(height: 48),
            const SectionHeader(title: "Today's Schedule", subtitle: 'Oct 24, 2023'),
            const SizedBox(height: 24),
            const ScheduleTimeline(),
            const SizedBox(height: 48),
            const SectionHeader(title: 'Upcoming'),
            const SizedBox(height: 24),
            const TaskList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}

class ScheduleTimeline extends StatelessWidget {
  const ScheduleTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _buildTimelineItem(context, '09:00', 'Deep Work: Design Audit', 'Focus on the Monastic System'),
          const SizedBox(height: 32),
          _buildActiveItem(context, '11:30', 'Project Sync', 'Review quarterly benchmarks'),
          const SizedBox(height: 32),
          _buildTimelineItem(context, '14:00', 'Architecture Review', 'Room 402 or via Link'),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, String time, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 48,
          child: Text(
            time,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 11,
                  color: AppColors.mutedText.withOpacity(0.4),
                ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.mutedText.withOpacity(0.6))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActiveItem(BuildContext context, String time, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 48,
          child: Text(
            time,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.elevated,
              borderRadius: BorderRadius.circular(12),
              border: const Border(left: BorderSide(color: Colors.white, width: 2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: const Text('NOW', style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white.withOpacity(0.7))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTaskTile(context, 'PRIORITY HIGH', 'Refactor navigation logic', 'Tomorrow'),
        const SizedBox(height: 12),
        _buildTaskTile(context, 'PRIORITY MED', 'Quarterly budget submission', 'Oct 26'),
        const SizedBox(height: 12),
        _buildTaskTile(context, 'PRIORITY LOW', 'Update brand documentation', 'Oct 28'),
      ],
    );
  }

  Widget _buildTaskTile(BuildContext context, String priority, String title, String date) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                priority,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mutedText.withOpacity(0.4),
                    ),
              ),
              Icon(Icons.more_horiz, color: AppColors.mutedText.withOpacity(0.2)),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.mutedText.withOpacity(0.4)),
              const SizedBox(width: 8),
              Text(
                date,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.mutedText.withOpacity(0.4),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
