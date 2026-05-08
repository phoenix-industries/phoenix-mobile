import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> steps = [
      {
        "icon": Icons.support_agent,
        "title": "Reach Out",
        "desc": "Tap Help & Support or use the chat icon to start a request."
      },
      {
        "icon": Icons.smart_toy_outlined,
        "title": "AI Assistance & Guidance",
        "desc": "Our AI helper reviews your issue and suggests quick fixes or connects you with support."
      },
      {
        "icon": Icons.handshake,
        "title": "Resolution & Follow‑Up",
        "desc": "Get your issue resolved and receive confirmation. Rate or reopen if needed."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: const Color(0xfff0500a),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "How It Works",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(steps.length, (index) {
                  final step = steps[index];
                  return Expanded(
  child: ListView.builder(
    itemCount: steps.length,
    itemBuilder: (context, index) {
      final step = steps[index];
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xfff0500a), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xfff0500a),
              radius: 22,
              child: Text(
                "${index + 1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Icon(step["icon"] as IconData,
                color: const Color(0xfff0500a), size: 32),
            const SizedBox(height: 12),
            Text(
              step["title"]!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              step["desc"]!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      );
    },
  ),
);

                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
