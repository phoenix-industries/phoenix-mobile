import 'package:flutter/material.dart';
import 'package:phoenix/Utils/helper/appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() =>
      _NotificationPageState();
}

class _NotificationPageState
    extends State<NotificationPage> {
  bool chatSounds = true;
  bool systemNotifications = true;
  bool emailUpdates = false;
  bool promotions = false;
  bool donationAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbar(width: MediaQuery.of(context).size.width),
      body: ListView(
        children: [
          CheckboxListTile(
            title: const Text("Chat Sounds"),
            value: chatSounds,
            onChanged: (val) => setState(() => chatSounds = val!),
            secondary: const Icon(Icons.chat),
            checkColor: Colors.white,
            activeColor:Color(0xfff0500a),
          ),
          CheckboxListTile(
            title: const Text("System Notifications"),
            value: systemNotifications,
            onChanged: (val) => setState(() => systemNotifications = val!),
            secondary: const Icon(Icons.notifications),
            checkColor: Colors.white,
            activeColor:Color(0xfff0500a),
          ),
          CheckboxListTile(
            title: const Text("Email Updates"),
            value: emailUpdates,
            onChanged: (val) => setState(() => emailUpdates = val!),
            secondary: const Icon(Icons.email),
            checkColor: Colors.white,
            activeColor:Color(0xfff0500a),
          ),
          CheckboxListTile(
            title: const Text("Promotions & Offers"),
            value: promotions,
            onChanged: (val) => setState(() => promotions = val!),
            secondary: const Icon(Icons.local_offer),
            checkColor: Colors.white,
            activeColor:Color(0xfff0500a),
          ),
          CheckboxListTile(
            title: const Text("Donation Alerts"),
            value: donationAlerts,
            onChanged: (val) => setState(() => donationAlerts = val!),
            secondary: const Icon(Icons.volunteer_activism),
            checkColor: Colors.white,
            activeColor:Color(0xfff0500a),
          ),
          const SizedBox(height: 20),

         Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: SizedBox(
    width: double.infinity,
    height: 50,
    child: InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        // Save preferences 
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Preferences saved ✅")),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xfffec517), Color(0xfff43f06)],
          ),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Save Preferences",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
    ),
   )

        ],
      ),
    );
  }
}
