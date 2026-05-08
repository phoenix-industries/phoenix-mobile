import 'package:flutter/material.dart';

Future<void> showLogoutDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text("Confirm Logout",),
        content: const Text("Are you sure you want to log out?",),
        actions: [
          TextButton(
            child: const Text("Cancel", style: TextStyle(color: Color(0xfff0500a))),
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
            },
          ),
          TextButton(
            child: const Text("Sure", style: TextStyle(color: Color(0xfff0500a))),
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
              Navigator.pushReplacementNamed(
                context,'/login', // Approutes.Loginscreen
              );
            },
          ),
        ],
      );
    },
  );
}
