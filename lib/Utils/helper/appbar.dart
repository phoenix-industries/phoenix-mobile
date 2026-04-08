import 'package:flutter/material.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  const appbar({super.key, required this.width});

  final double width;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.jpeg',
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
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_active_rounded),
          color: Colors.black,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.person),
          color: Colors.black,
        ),
      ],
    );
  }
}
