import 'package:flutter/material.dart';
import 'package:phoenix/Utils/helper/checklistwidget.dart';
import 'package:phoenix/Utils/helper/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  // Privacy toggles
  bool hideEmail = true;
  bool hideLocation = false;
  bool showPhone = true;

  String? _lastLogin;

  @override
  void initState() {
    super.initState();
    _loadLoginTime();
  }

  Future<void> _loadLoginTime() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString('lastLogin');
    if (saved != null) {
      final dt = DateTime.parse(saved);
      setState(() {
        _lastLogin = "${dt.month}/${dt.day}/${dt.year}, "
                     "${dt.hour}:${dt.minute}:${dt.second}";
      });
    }
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool get passwordsMatch =>
      _newPasswordController.text == _confirmPasswordController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbar(width: MediaQuery.of(context).size.width),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
             color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).colorScheme.outline,),
          ),
          child: Column(
            children: [
              const Text("Change Password",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // Current Password
            TextField(
              controller: _currentPasswordController,
              obscureText: _obscureCurrent,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                labelText: "Current Password",
                suffixIcon: IconButton(
                  icon: Icon(_obscureCurrent ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscureCurrent = !_obscureCurrent),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // New Password
            TextField(
              controller: _newPasswordController,
              obscureText: _obscureNew,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                labelText: "New Password",
                suffixIcon: IconButton(
                  icon: Icon(_obscureNew ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscureNew = !_obscureNew),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            PasswordChecklist(password: _newPasswordController.text),

            const SizedBox(height: 16),

            // Confirm Password
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirm,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Color(0xfff0500a), width: 2),),
                    floatingLabelStyle: TextStyle(color: Color(0xfff0500a)),
                labelText: "Confirm Password",
                suffixIcon: IconButton(
                  icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            if (!passwordsMatch && _confirmPasswordController.text.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text("Passwords do not match ❌", style: TextStyle(color: Colors.red)),
              ),

            const SizedBox(height: 24),

           SizedBox(
  width: double.infinity,
  height: 50,
  child: InkWell(
    borderRadius: BorderRadius.circular(16), // ripple respects rounded corners
    onTap: () {
      if (!passwordsMatch) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords must match ❌")),
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password updated ✅")),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xfffec517), Color(0xfff43f06)], // your gradient
        ),
      ),
      alignment: Alignment.center,
      child: const Text(
        "Update Password",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
)

            ],
          ),
          ),
            
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                 color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).colorScheme.outline,),
              ),

              child: Column(children: [
                const Text("Privacy Settings",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            CheckboxListTile(
              title: const Text("Hide email from public"),
              value: hideEmail,
              onChanged: (val) => setState(() => hideEmail = val!),
              secondary: const Icon(Icons.email),
              checkColor: Colors.white,
              activeColor:Color(0xfff0500a),
            ),
            CheckboxListTile(
              title: const Text("Hide location from listings"),
              value: hideLocation,
              onChanged: (val) => setState(() => hideLocation = val!),
              secondary: const Icon(Icons.location_on),
              checkColor: Colors.white,
              activeColor:Color(0xfff0500a),
            ),
            CheckboxListTile(
              title: const Text("Show phone number in profile"),
              value: showPhone,
              onChanged: (val) => setState(() => showPhone = val!),
              secondary: const Icon(Icons.phone),
              checkColor: Colors.white,
              activeColor:Color(0xfff0500a),
            ),

            const SizedBox(height: 16),
            SizedBox(
  width: double.infinity,
  height: 50,
  child: InkWell(
    borderRadius: BorderRadius.circular(16), // ripple respects rounded corners
    onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Privacy settings saved ✅")),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xfffec517), Color(0xfff43f06)], // your gradient
        ),
      ),
      alignment: Alignment.center,
      child: const Text(
        "Save Privacy Settings",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  ),
)

              ],),
            ),
            const SizedBox(height: 40),
            Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                 color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Theme.of(context).colorScheme.outline,),
                ),
  
                child: Column(children: [
                  const Text("Last Time Login",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children:[
                Icon(Icons.access_time, color: Color(0xfff0500a)),
                SizedBox(width: 8),
                Text(_lastLogin ?? "No login recorded"),
              ],
            ),
                ],),
              ),

          ],
        ),
      ),
    );
  }
}

