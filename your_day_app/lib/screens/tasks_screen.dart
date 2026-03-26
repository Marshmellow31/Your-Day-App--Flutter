import 'package:flutter/material.dart';
import '../widgets/base_widgets.dart';
import '../widgets/app_bar.dart';
import '../theme/app_theme.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

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
              'Your Tasks',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 48,
                    height: 1.1,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'You have 4 priorities for today.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.mutedText,
                  ),
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.elevated,
                hintText: 'Search tasks...',
                hintStyle: TextStyle(color: AppColors.mutedText.withOpacity(0.4)),
                prefixIcon: Icon(Icons.search, color: AppColors.mutedText.withOpacity(0.4)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All', isSelected: true),
                  _buildFilterChip('Academic'),
                  _buildFilterChip('Research'),
                  _buildFilterChip('Personal'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _buildPriorityTask(context, 'HIGH PRIORITY', 'Submit Thesis Draft', 'Advanced Architecture IV', 'Due: Today, 5:00 PM', isHigh: true),
            const SizedBox(height: 16),
            _buildPriorityTask(context, 'MEDIUM PRIORITY', 'Group Review Session', 'Comparative Literature', 'Tomorrow, 10:00 AM'),
            const SizedBox(height: 16),
            _buildPriorityTask(context, 'MEDIUM PRIORITY', 'Lab Equipment Return', 'Physics Department', 'Friday, 3:00 PM'),
            const SizedBox(height: 16),
            _buildPriorityTask(context, 'LOW PRIORITY', 'Order Textbook Replacements', 'Personal Administration', 'Next Week', isLow: true),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }

  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label.toUpperCase()),
        backgroundColor: isSelected ? Colors.white : AppColors.elevated,
        labelStyle: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide.none,
      ),
    );
  }

  Widget _buildPriorityTask(BuildContext context, String priority, String title, String subtitle, String time, {bool isHigh = false, bool isLow = false}) {
    return CustomCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: isHigh ? Colors.white.withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  priority,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        color: isLow ? AppColors.mutedText.withOpacity(0.4) : (isHigh ? Colors.white : AppColors.mutedText),
                      ),
                ),
              ),
              Icon(Icons.more_horiz, color: AppColors.mutedText.withOpacity(0.2)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 18,
                  color: isLow ? AppColors.primaryText.withOpacity(0.6) : AppColors.primaryText,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isLow ? AppColors.mutedText.withOpacity(0.4) : AppColors.mutedText,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined, size: 14, color: AppColors.mutedText.withOpacity(0.4)),
              const SizedBox(width: 8),
              Text(
                time,
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
