import 'package:flutter/material.dart';
import 'package:phoenix/pages/Profilepage.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  const appbar({super.key, required this.width});

  final double width;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      shape: Border(
        bottom: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: 1.5,
        ),
      ),
      title: Row(
        children: [
          Image.asset(
            'assets/images/Phoenix.png',
            height: width * 0.12,
            width: width * 0.12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'phoenix',
                style: TextStyle(
                  fontSize: width * 0.05,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0Xfff8d402), Color(0xfff0500a)],
                    ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
                ),
              ),
              Text(
                'donate & trade',
                style: TextStyle(fontSize: width * 0.035, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
      actions: [
        // Notifications button
        Tooltip(
          message: "Go to chats",
          decoration: BoxDecoration(
            color: Color(0xfff0500a),
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: TextStyle(color: Colors.white),
          waitDuration: const Duration(
            milliseconds: 500,
          ), // delay before showing
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/chats');
            },
            icon: const Icon(Icons.message_outlined),
          ),
        ),
        //profile button
        Tooltip(
          message: "Go to Profile",
          decoration: BoxDecoration(
            color: Color(0xfff0500a),
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: TextStyle(color: Colors.white),
          waitDuration: const Duration(
            milliseconds: 500,
          ), // delay before showing
          child: IconButton(
            onPressed: () {
              final currentRoute = ModalRoute.of(context)?.settings.name;
              if (currentRoute != '/profile') {
                Navigator.pushNamed(context, '/profile');
              }
            },
            icon: const Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}
