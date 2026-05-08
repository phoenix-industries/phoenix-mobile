import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/UserClass.dart';

class ChatBuble extends StatelessWidget {
  final String text;
  final String time;
  final int sanderID;
  final UserClass currentuser;
  ChatBuble({
    super.key,
    required this.text,
    required this.time,
    required this.sanderID,
    required this.currentuser,
  });

  @override
  Widget build(BuildContext context) {
    final bool Isme = sanderID == currentuser.Id;
    return Align(
      alignment: Isme ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.70,
        ),
        decoration: BoxDecoration(
          gradient: Isme
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xfffec517), Color(0xfff43f06)],
                )
              : const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Colors.white],
                ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(Isme ? 20 : 0),
            bottomRight: Radius.circular(Isme ? 0 : 20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                color: Isme ? Colors.white : Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
