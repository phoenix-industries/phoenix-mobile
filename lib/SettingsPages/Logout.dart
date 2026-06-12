import 'package:flutter/material.dart';
import 'package:phoenix/Utils/providers/userprovider.dart';
import 'package:phoenix/Utils/service/Authservise.dart';
import 'package:provider/provider.dart';

Future<void> showLogoutDialog(BuildContext parentContext) async {
  return showDialog(
    context: parentContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            child: const Text(
              "Cancel",
              style: TextStyle(color: Color(0xfff0500a)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              "Sure",
              style: TextStyle(color: Color(0xfff0500a)),
            ),
            onPressed: () async {
              final success = await Authservise().logout();

              if (success) {
                Navigator.of(context).pop();

                parentContext.read<Userprovider>().clearuser();

                Navigator.pushNamed(parentContext, '/login');
              }
            },
          ),
        ],
      );
    },
  );
}
