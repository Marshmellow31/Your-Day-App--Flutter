import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../widgets/base_widgets.dart';
import '../widgets/app_bar.dart';
import '../theme/app_theme.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

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
              'Persistence',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 48,
                    height: 1.1,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your analytical breakdown for the semester.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.mutedText,
                  ),
            ),
            const SizedBox(height: 48),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              children: const [
                StatTile(label: 'Completion', value: '94%'),
                StatTile(label: 'Streak', value: '12', subValue: 'days'),
                StatTile(label: 'Overdue', value: '02'),
              ],
            ),
            const SizedBox(height: 48),
            const Text('Weekly Momentum', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            CustomCard(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildWeeklyBar('M', 0.4),
                    _buildWeeklyBar('T', 0.65),
                    _buildWeeklyBar('W', 0.5),
                    _buildWeeklyBar('T', 0.9, isActive: true),
                    _buildWeeklyBar('F', 0.45),
                    _buildWeeklyBar('S', 0.2),
                    _buildWeeklyBar('S', 0.1),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            const Text('Subject Mastery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            _buildSubjectMastery('Applied Mathematics', 0.88),
            const SizedBox(height: 12),
            _buildSubjectMastery('Cognitive Psychology', 0.72),
            const SizedBox(height: 12),
            _buildSubjectMastery('Advanced Linguistics', 0.96),
            const SizedBox(height: 48),
            CustomCard(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Column(
                  children: [
                    Text('DEEP WORK QUALITY', style: TextStyle(fontSize: 10, color: AppColors.mutedText.withOpacity(0.6), fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                    const SizedBox(height: 24),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CircularProgressIndicator(
                            value: 0.8,
                            strokeWidth: 2,
                            backgroundColor: Colors.white.withOpacity(0.1),
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                        const Text('A+', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'You are spending 4.5h avg. in flow state this week.',
                      style: TextStyle(color: AppColors.mutedText.withOpacity(0.8), fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklyBar(String day, double percent, {bool isActive = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 80 * percent,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.1),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
          ),
        ),
        const SizedBox(height: 8),
        Text(day, style: TextStyle(fontSize: 10, color: isActive ? Colors.white : AppColors.mutedText.withOpacity(0.4))),
      ],
    );
  }

  Widget _buildSubjectMastery(String subject, double mastery) {
    return CustomCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subject, style: const TextStyle(fontWeight: FontWeight.w500)),
              Text('${(mastery * 100).toInt()}%', style: TextStyle(color: AppColors.mutedText, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: mastery,
            minHeight: 2,
            backgroundColor: Colors.white.withOpacity(0.1),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}
