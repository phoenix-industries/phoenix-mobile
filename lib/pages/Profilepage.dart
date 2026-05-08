import 'package:flutter/material.dart';
import 'package:phoenix/pages/Donate_SellPage.dart';
import 'package:phoenix/Utils/helper/appbar.dart';

class ProfilePage extends StatelessWidget {
  /*
  final String name;
  final String phone;
  final String email;*/

  const ProfilePage({super.key,/*
  required this.name,
  required this.phone,
  required this.email,*/});
  
  final String name = "Frank Castle";
  final String phone = "0102658568895";
  final String email = "punisher124@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: appbar(width: MediaQuery.of(context).size.width),
      body: ListView(
        children: [
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).colorScheme.outline,),
          ),
          child : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar + Info
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xfff0500a),
                  child: Text(
                    name.isNotEmpty
                        ? name.substring(0, 2).toUpperCase() // initials
                        : "??",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(phone),
                    Text(email),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Edit Profile button
            SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.zero, // remove default padding
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.transparent, // important
      shadowColor: Colors.transparent,     // remove shadow
    ),
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/fram');
    },
    child: Ink(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xfff0500a), Color(0Xfff8d402)], // orange → yellow
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: const Text(
          "LET'S START",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  ),
),
            const SizedBox(height: 20),
            // Warnings
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.warning, color: Color(0xfff0500a)),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text("Please complete your profile in the Settings"),
                  ),
                   TextButton(
                 style: TextButton.styleFrom(
                 padding: EdgeInsets.zero, 
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                ),
                ),
                 onPressed: () {
                 Navigator.pushNamed(context, '/edit_profile');
                  },
                child: Ink(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
               gradient: const LinearGradient(
               begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xfffec517), Color(0xfff43f06)], 
              ),
              ),
              child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: const Text(
                 "Go to Settings",
              style: TextStyle(color: Colors.white, fontSize: 16),
             ),
             ),
            ),
            )
                ],
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info, color: Color(0xfff0500a)),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text("Please complete your bio in the Settings"),
                  ),
                  TextButton(
                 style: TextButton.styleFrom(
                 padding: EdgeInsets.zero, 
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                ),
                ),
                 onPressed: () {
                 Navigator.pushNamed(context, '/edit_profile');
                  },
                child: Ink(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
               gradient: const LinearGradient(
               begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xfffec517), Color(0xfff43f06)], 
              ),
              ),
              child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: const Text(
                 "Go to Settings",
              style: TextStyle(color: Colors.white, fontSize: 16),
             ),
             ),
            ),
            )

                ],
              ),
            ),
          ],
        ),
        ),
      ),
      Padding(padding: EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 130,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1),

        ),
        child : PageView(
          scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xfff0500a), width: 2),
            ),
            child: const Text("Active Listings", style: TextStyle(fontSize: 15,), textAlign: TextAlign.center,),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xfff0500a), width: 2),
            ),
            child: const Text("Successful Trades", style: TextStyle(fontSize: 15,), textAlign: TextAlign.center,),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xfff0500a), width: 2),
            ),
            child: const Text("Average Rating", style: TextStyle(fontSize: 15,), textAlign: TextAlign.center,),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xfff0500a), width: 2),
            ),
            child: const Text("Response Time", style: TextStyle(fontSize: 15,), textAlign: TextAlign.center,),
          ),
        ],
        )
      ) ,
      ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      // Title + Add New button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                  Text( 
                "My Listings",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
        height: 45,
        width: 90,
        child: InkWell(
        borderRadius: BorderRadius.circular(16), 
        onTap: () {
      // Navigate to add new listing page
      Navigator.pushNamed(context, '/donate_sell');
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
        "+ Add New",
        style: TextStyle(color: Colors.white, fontSize: 16),
       ),
       ),
        ),
        )
        ],
      ),

      const SizedBox(height: 16),

      // Tabs (only 2 now)
            DefaultTabController(
               length: 2,
              child: Column(
               children: [
            TabBar(
              labelColor: Color(0xfff0500a),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xfff0500a),
              tabs: const [
                Tab(text: "Sells"),
                Tab(text: "Donations"),
              ],
            ),
            SizedBox(
              height: 150,
              child: TabBarView(
                children: [
                  Center(child: Text("No active sells. Start selling your items now!", textAlign: TextAlign.center,)),
                  Center(child: Text("No active donations. Start donating your items now!", textAlign: TextAlign.center,)),
                ],
               ),
              ),
             ],
           ),
             ),
                ],
             ),
               ),

      ],
      )
      
    );
  }
}
