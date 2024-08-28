import 'package:flutter/material.dart';
import 'package:untitled/page/settings/settings_tile.dart';
import 'package:untitled/widget/card/card_layout.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: Column(
            children: [
              CardLayout(
                children: [
                  SettingsTile(
                    icon: Icons.person,
                    title: 'Profile Settings',
                    subtitle: 'Edit your profile',
                    onTap: () {
                    },
                  ),
                  SettingsTile(
                    icon: Icons.color_lens,
                    title: 'Theme',
                    onTap: () {
                    },
                  ),
                  SettingsTile(
                    icon: Icons.language,
                    title: 'Language',
                    onTap: () {
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              CardLayout(
                children: [
                  SettingsTile(
                    icon: Icons.info_outline,
                    title: 'About Us',
                    onTap: () {
                    },
                  ),
                  SettingsTile(
                    icon: Icons.contact_support,
                    title: 'Contact Support',
                    onTap: () {
                    },
                  ),
                  SettingsTile(
                    icon: Icons.feedback,
                    title: 'Feedback',
                    onTap: () {
                    },
                  ),
                  SettingsTile(
                    icon: Icons.security,
                    title: 'Security',
                    subtitle: 'Manage security settings',
                    onTap: () {
                    },
                  ),
                  SettingsTile(
                    icon: Icons.info,
                    title: 'Version Info',
                    onTap: () {
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              CardLayout(
                children: [
                  SettingsTile(
                    icon: Icons.logout_rounded,
                    title: 'Logout',
                    onTap: () {
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
