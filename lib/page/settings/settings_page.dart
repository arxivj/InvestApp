import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/korea_investment_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeader(),
            AccountDetailsSection(),
            SettingsOptions(),
            LogoutButton(),
            SizedBox(height: 20.h),
            Divider(
              thickness: 5,
              height: 5,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            SizedBox(height: 20.h),
            Text('Test Button', style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 20.h),
            TestButton(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.sp, // Profile picture size
            backgroundColor: Colors.blue,
            child: Text('@',
                style: TextStyle(
                    fontSize: 24.sp,
                    color: Colors.white)), // Placeholder for profile picture
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@username',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AccountDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account Details', style: Theme.of(context).textTheme.headline6),
          Divider(),
          AccountDetailRow(
            label: 'Name',
            value: 'Dollar',
            icon: Icons.flag,
          ),
          AccountDetailRow(
            label: 'Account',
            value: '1234-5678',
            icon: Icons.copy,
          ),
          AccountDetailRow(
            label: 'Bank name',
            value: 'KB',
            icon: Icons.copy,
          ),
        ],
      ),
    );
  }
}

class AccountDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const AccountDetailRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16.sp)),
          Row(
            children: [
              Text(value, style: TextStyle(fontSize: 16.sp)),
              IconButton(
                onPressed: () {},
                icon: Icon(icon, size: 18.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingsOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SettingsOptionRow(
            icon: Icons.grade,
            text: 'Grade',
          ),
          SettingsOptionRow(
            icon: Icons.security,
            text: 'Security & privacy',
          ),
          SettingsOptionRow(
            icon: Icons.settings,
            text: 'App settings',
          ),
        ],
      ),
    );
  }
}

class SettingsOptionRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const SettingsOptionRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 30.sp),
      title: Text(text),
      onTap: () {},
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout),
      title: const Text('Log out'),
      onTap: () {},
    );
  }
}

class TestButton extends StatelessWidget {
  const TestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () async {
            await AuthService().requestAndStoreToken();
          },
          child: const Text('Request token'),
        ),
        ElevatedButton(
          onPressed: () async {
            await AuthService().revokeToken();
          },
          child: const Text('Revoke token'),
        ),
      ],
    );
  }
}
