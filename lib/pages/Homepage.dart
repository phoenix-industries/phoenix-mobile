import 'package:flutter/material.dart';
import 'package:phoenix/Utils/helper/itemcard.dart';
import 'package:phoenix/Utils/providers/itemprovider.dart';
import 'package:provider/provider.dart';
import 'package:phoenix/Utils/helper/appbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Itemprovider>(context, listen: false).recomdationitem();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'Welcome back,',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..shader = LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromARGB(255, 51, 51, 51),
                      Color(0xfff0500a),
                    ],
                  ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
              ),
            ),

            Text(
              'Start exploring',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                foreground: Paint()
                  ..shader = LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xfff0500a), Color(0Xfff8d402)],
                  ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
              ),
            ),

            Text(
              'Discover items donated or sold by the community near you',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Theme.of(context).iconTheme.color),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Text(
                  'Recommended',
                  style: TextStyle(color: Theme.of(context).iconTheme.color, fontSize: 30),
                ),
                Text(
                  ' for you',
                  style: TextStyle(color: Color(0xfff0500a), fontSize: 25),
                ),
              ],
            ),
            SizedBox(height: 8),
            Consumer<Itemprovider>(
              builder: (context, provider, child) {
                if (provider.isloading) {
                  return Center(child: CircularProgressIndicator());
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7, // تأكدي من ضبطها حسب شكل الكارد
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: provider.items.length,
                  itemBuilder: (context, index) {
                    return Itemcard(item: provider.items[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
