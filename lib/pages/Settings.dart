import 'package:flutter/material.dart';
import 'package:phoenix/SettingsPages/Privacyscreen.dart';
import 'package:phoenix/Utils/helper/appbar.dart';
import 'package:phoenix/SettingsPages/Logout.dart';
import 'package:phoenix/SettingsPages/Notificationscreen.dart';
import 'package:provider/provider.dart';
import 'package:phoenix/Utils/providers/Themeprovider.dart';
import 'package:phoenix/SettingsPages/Darkmodetoggle.dart';
import 'package:phoenix/SettingsPages/Accountscreen.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text("Account"),
            subtitle: const Text("Manage your account settings"),
            onTap: () {
              // Navigate to Account Settings
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfilePage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Notifications"),
            subtitle: const Text("Manage notification preferences"),
            onTap: () {
              // Navigate to Notification Settings
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Privacy & Security"),
            subtitle: const Text("Manage your privacy settings"),
            onTap: () {
              // Navigate to Privacy Settings
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Help & Support"),
            subtitle: const Text("Get help or contact support"),
            onTap: () {
              // Navigate to Help & Support
            },
          ),
          const Divider(),
          const DarkModeToggle(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Color.fromARGB(255, 225, 15, 0)),
            title: const Text("Logout", style: TextStyle(color: Color.fromARGB(255, 225, 15, 0))),
            subtitle: const Text("Sign out of your account", style: TextStyle(color: Color.fromARGB(255, 225, 15, 0))),
            onTap: () {
              // Show logout confirmation dialog
              showLogoutDialog(context);
            },
          ),
          const Divider(),


        ],
      ),
    );
  }
}

