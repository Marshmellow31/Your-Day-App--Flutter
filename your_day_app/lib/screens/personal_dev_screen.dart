import 'package:flutter/material.dart';
import '../widgets/base_widgets.dart';
import '../theme/app_theme.dart';

class PersonalDevelopmentScreen extends StatelessWidget {
  const PersonalDevelopmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              'Efficiency Rating',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.mutedText.withOpacity(0.4),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'Mastery Index',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 48,
                        height: 1.1,
                      ),
                ),
                const SizedBox(width: 16),
                Text(
                  '84%',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 24,
                        color: AppColors.mutedText.withOpacity(0.4),
                      ),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Active Intentions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.elevated,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text('ADD GOAL', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildGoalCard(
              context,
              'Advanced Algorithms',
              'CS Graduate Mastery Path',
              0.62,
              [
                'Solve 3 LeetCode Hard problems',
                'Review dynamic programming patterns',
                'Implement Dijkstra\'s in Rust',
              ],
              [true, false, false],
            ),
            const SizedBox(height: 16),
            _buildGoalCard(
              context,
              'Monastic Writing',
              'Daily Deep Work Practice',
              0.28,
              [
                '1,500 words of thesis draft',
                'Annotate 4 peer-reviewed sources',
              ],
              [false, false],
            ),
            const SizedBox(height: 48),
            const Text('Mastery Velocity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            CustomCard(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('12.4', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                      Text('TASKS / DAY', style: TextStyle(fontSize: 10, color: AppColors.mutedText.withOpacity(0.6), fontWeight: FontWeight.bold)),
                    ],
                  ),
                  _buildMiniChart(),
                ],
              ),
            ),
          ],
        ),
      );
  }

  Widget _buildGoalCard(BuildContext context, String title, String subtitle, double progress, List<String> tasks, List<bool> completed) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: TextStyle(color: AppColors.mutedText.withOpacity(0.6), fontSize: 13)),
                ],
              ),
              Icon(Icons.more_horiz, color: AppColors.mutedText.withOpacity(0.4)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('PROGRESS', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              Text('${(progress * 100).toInt()}%', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: AppColors.borders,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            minHeight: 2,
          ),
          const SizedBox(height: 24),
          ...List.generate(tasks.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Icon(
                    completed[index] ? Icons.check_circle : Icons.radio_button_unchecked,
                    size: 18,
                    color: completed[index] ? Colors.white : AppColors.mutedText.withOpacity(0.2),
                  ),
                  const SizedBox(width: 12),
                  Text(tasks[index], style: TextStyle(fontSize: 14, color: completed[index] ? Colors.white : AppColors.mutedText)),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMiniChart() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildBar(16, 0.2),
        _buildBar(24, 0.2),
        _buildBar(32, 0.4),
        _buildBar(48, 1.0),
        _buildBar(40, 0.6),
      ],
    );
  }

  Widget _buildBar(double height, double opacity) {
    return Container(
      width: 8,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(opacity),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
      ),
    );
  }
}
