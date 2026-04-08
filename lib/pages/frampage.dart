import 'package:flutter/material.dart';
import 'package:phoenix/Utils/helper/appbar.dart';
import 'package:phoenix/pages/Donate%20&%20Sell%20Page.dart';
import 'package:phoenix/pages/Homepage.dart';
import 'package:phoenix/pages/Market.dart';

class frampage extends StatefulWidget {
  const frampage({super.key});

  @override
  State<frampage> createState() => _frampageState();
}

class _frampageState extends State<frampage> {
  int _selectedIndex = 0;
  final List<Widget> _page = [Homepage(), Marketpage(), DonateOrsellpage()];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(width: width),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Market'),
              leading: Icon(Icons.store_rounded),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Donate & sell'),
              leading: Icon(Icons.volunteer_activism_sharp),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _page[_selectedIndex],
    );
  }
}
