import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/itemBuyclass.dart';
import 'package:phoenix/Utils/helper/appbar.dart';

class Viewitem extends StatefulWidget {
  const Viewitem({super.key});

  @override
  State<Viewitem> createState() => _ViewitemState();
}

class _ViewitemState extends State<Viewitem> {
    final PageController _pageController = PageController();
    int _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final item = ModalRoute.of(context)!.settings.arguments as ItemBuyclass;
    
    return Scaffold(
      appBar: appbar(width: width),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.05,
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .06),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ListView(
          children: [
            Container(
              height: 300,
              margin: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.02,
              ),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .06),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: PageView.builder(
                itemCount: item.images.length,
                onPageChanged: (index) {
                  setState(() {
                    _selectedImage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.network(item.images[index], fit: BoxFit.cover);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(item.images.length, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 3,
                    vertical: 8,
                  ),
                  width: _selectedImage == index ? 12 : 8,
                  height: _selectedImage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: _selectedImage == index
                        ? Color(0xfff0500a)
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(
              item.itemName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Align(
              alignment: Alignment.centerLeft, // أو center حسب رغبتك
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .06),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.sell, color: Color(0xfff0500a), size: 18),
                    Text(
                      item.category,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),

                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outline,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .06),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xfff0500a),
                          size: 18,
                        ),
                        Text(
                          item.time,
                          style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xfff0500a),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .06),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      item.Condation,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              '${item.price} EGP',
              style: TextStyle(color: Color(0xfff0500a), fontSize: 40),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                Text(item.location, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Text(
              'Product Description',
              style: TextStyle(color: Color(0xfff0500a), fontSize: 28),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Text(item.description),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),

            Text(
              item.personName,
              style: TextStyle(color: Color(0xfff0500a), fontSize: 38),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xfffec517), Color(0xfff43f06)],
                  ),
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Center(
                    child: Text(
                      'Chat With Seller',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
