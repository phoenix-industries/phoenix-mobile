import 'package:flutter/material.dart';
import 'package:phoenix/Utils/helper/appbar.dart';
import 'package:phoenix/pages/Donate_SellPage.dart';
import 'package:phoenix/pages/Homepage.dart';
import 'package:phoenix/pages/Market.dart';
import 'package:phoenix/pages/Settings.dart';
import 'package:phoenix/Utils/service/approutes.dart';
import 'package:phoenix/pages/Profilepage.dart';
import 'package:phoenix/pages/Onboardingscreen.dart';

class frampage extends StatefulWidget {
  const frampage({super.key});

  @override
  State<frampage> createState() => _frampageState();
}

class _frampageState extends State<frampage> {
  int _selectedIndex = 0;
  final List<Widget> _page = [
    // Homepage(),
    Marketpage(),
    DonateOrsellpage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != 0) {
          setState(() {
            _selectedIndex = 0;
          });
          return false; // stay in app
        }

        final shouldExit = await showDialog<bool>(
          context: context,
          barrierDismissible: false, // force user to choose
          builder: (context) => AlertDialog(
            title: const Text("Exit App"),
            content: const Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Color(0xfff0500a)),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  "Exit",
                  style: TextStyle(color: Color(0xfff0500a)),
                ),
              ),
            ],
          ),
        );

        // Only exit if explicitly confirmed
        return shouldExit == true;
      },

      child: Scaffold(
        appBar: appbar(width: width),
        drawer: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: ListView(
            children: [
              const Divider(),
              // ListTile(
              //   title: const Text('Home'),
              //   leading: const Icon(Icons.home),
              //   onTap: () {
              //     setState(() {
              //       _selectedIndex = 0;
              //     });
              //     Navigator.pop(context);
              //   },
              // ),
              const Divider(),
              ListTile(
                title: const Text('Market'),
                leading: const Icon(Icons.store_rounded),
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Donate & sell'),
                leading: const Icon(Icons.volunteer_activism_sharp),
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Settings'),
                leading: const Icon(Icons.settings),
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              const Divider(),
            ],
          ),
        ),
        body: _page[_selectedIndex],
      ),
    );
  }
}
