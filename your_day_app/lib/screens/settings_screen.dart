import 'package:flutter/material.dart';
import '../widgets/base_widgets.dart';
import '../widgets/app_bar.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            const Text(
              'Your Account',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Manrope'),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDAzSqkjjzEWBQVk0ICNLeJq2HFIEiq-xx2z3BRdZ1sc0ocRDoTUGivQNs1c1V-nRGSqlZVO0mBFvo6Z0NXKJaJ5IfzWYbtvKR7_ue4QsFhBfQG-MEwAAa8IhCBD06M3QlnyRvxvR2xUqfmYQXmwRkOZyMPqZZAEP-iXiu-N0hdXXo4VFYyaArgVVsqZTl1Ti0KmOTbW072WYfgZODBGRM0yz75nK5FktFy4uDbHMIZJurujrEO70xzfJd83LYuZ3PVmECLR3RfpW7C'),
                  ),
                  const SizedBox(width: 16),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Julian Avery', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                      Text('Graduate Student • Year 2', style: TextStyle(color: AppColors.mutedText, fontSize: 14)),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.edit_outlined, color: AppColors.mutedText.withOpacity(0.4)),
                ],
              ),
            ),
            const SizedBox(height: 48),
            _buildSettingsGroup(context, 'PREFERENCES', [
              _buildSettingsTile(context, Icons.notifications_outlined, 'Notifications', trailing: _buildToggle(true)),
              _buildSettingsTile(context, Icons.calendar_today_outlined, 'Academic Dates'),
              _buildSettingsTile(context, Icons.flag_outlined, 'Study Goals', subtitle: '4 Hours Daily'),
            ]),
            const SizedBox(height: 48),
            _buildSettingsGroup(context, 'SYSTEM', [
              _buildSettingsTile(context, Icons.security_outlined, 'Privacy & Security'),
              _buildSettingsTile(context, Icons.cloud_done_outlined, 'Data Sync', subtitle: 'Synced 2m ago'),
            ]),
            const SizedBox(height: 64),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                ),
                child: const Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'VERSION 2.4.0 (MONASTIC)',
                style: TextStyle(color: AppColors.mutedText.withOpacity(0.3), fontSize: 10, letterSpacing: 1.2, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(BuildContext context, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16),
          child: Text(title, style: TextStyle(color: AppColors.mutedText.withOpacity(0.6), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(BuildContext context, IconData icon, String title, {String? subtitle, Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.mutedText),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: AppColors.mutedText.withOpacity(0.6), fontSize: 12)) : null,
      trailing: trailing ?? Icon(Icons.chevron_right, color: AppColors.mutedText.withOpacity(0.4)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }

  Widget _buildToggle(bool value) {
    return Container(
      width: 40,
      height: 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(2),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: 16,
          height: 16,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
