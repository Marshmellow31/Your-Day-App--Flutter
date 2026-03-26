import 'package:flutter/material.dart';
import 'ai_scheduler_screen.dart';
import 'personal_dev_screen.dart';
import '../theme/app_theme.dart';

class GrowthScreen extends StatefulWidget {
  const GrowthScreen({super.key});

  @override
  State<GrowthScreen> createState() => _GrowthScreenState();
}

class _GrowthScreenState extends State<GrowthScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Growth'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: AppColors.mutedText,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Tab(text: 'STUDY FLOW'),
            Tab(text: 'MASTERY'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AISchedulerScreen(),
          PersonalDevelopmentScreen(),
        ],
      ),
    );
  }
}
