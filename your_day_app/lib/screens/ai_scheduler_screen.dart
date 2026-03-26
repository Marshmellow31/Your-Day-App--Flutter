import 'package:flutter/material.dart';
import '../widgets/base_widgets.dart';
import '../theme/app_theme.dart';

class AISchedulerScreen extends StatelessWidget {
  const AISchedulerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Study Flow',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 48,
                    height: 1.1,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'AI-optimized focus blocks for maximum academic output.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.mutedText,
                  ),
            ),
            const SizedBox(height: 48),
            const SectionHeader(title: 'Task Queue', subtitle: '3 PENDING'),
            const SizedBox(height: 16),
            _buildQueueItem('Physics Problem Set #4', 'High Intensity • 45m', hasBorder: true),
            const SizedBox(height: 12),
            _buildQueueItem('History Essay Outline', 'Creative Focus • 60m'),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text("Today's Schedule", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: const Text('RE-OPTIMIZE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildSchedulerTimeline(context),
          ],
        ),
      );
  }

  Widget _buildQueueItem(String title, String subtitle, {bool hasBorder = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: hasBorder ? const Border(left: BorderSide(color: Colors.white24, width: 4)) : Border.all(color: AppColors.borders),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: AppColors.mutedText.withOpacity(0.6), fontSize: 12)),
            ],
          ),
          Icon(Icons.more_vert, color: AppColors.mutedText.withOpacity(0.4), size: 18),
        ],
      ),
    );
  }

  Widget _buildSchedulerTimeline(BuildContext context) {
    return Column(
      children: [
        _buildScheduleItem(context, '09:00 — 10:30', 'Morning Lecture', 'Advanced Thermodynamics • Hall B', type: 'Fixed'),
        const SizedBox(height: 24),
        _buildScheduleItem(context, '11:00 — 12:30', 'Applied Mathematics', 'Solve remaining 12 problems', type: 'Focus Flow', isActive: true),
        const SizedBox(height: 24),
        Row(
          children: [
            const SizedBox(width: 8),
            Icon(Icons.coffee_outlined, size: 18, color: AppColors.mutedText.withOpacity(0.4)),
            const SizedBox(width: 12),
            Text('30m Recharge window', style: TextStyle(color: AppColors.mutedText.withOpacity(0.4), fontStyle: FontStyle.italic, fontSize: 13)),
          ],
        ),
        const SizedBox(height: 24),
        _buildScheduleItem(context, '13:00 — 14:00', 'Literature Review', 'Drafting intro for History paper', type: 'Flexible'),
      ],
    );
  }

  Widget _buildScheduleItem(BuildContext context, String time, String title, String subtitle, {required String type, bool isActive = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? Colors.white : AppColors.borders,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            Text(time, style: TextStyle(color: isActive ? Colors.white : AppColors.mutedText, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: isActive ? Colors.white : AppColors.elevated,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                type.toUpperCase(),
                style: TextStyle(
                  color: isActive ? Colors.black : AppColors.mutedText.withOpacity(0.6),
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: isActive ? null : Border.all(color: AppColors.borders),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isActive ? Colors.black : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isActive ? Colors.black.withOpacity(0.6) : AppColors.mutedText,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              if (isActive) const Icon(Icons.psychology_outlined, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}
