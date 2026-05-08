import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:phoenix/Utils/providers/Themeprovider.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SwitchListTile(
      title: const Text("Dark Mode"),
      value: themeProvider.themeMode == ThemeMode.dark,
      onChanged: (val) {
        themeProvider.toggleTheme(val);
      },
      secondary: const Icon(Icons.brightness_6),
       activeColor: Colors.deepOrange,           // thumb color when ON
       activeTrackColor: Colors.orange,  // track color when ON
       inactiveThumbColor: Colors.grey,      // thumb color when OFF
       inactiveTrackColor: Colors.black26, 
    );
  }
}
