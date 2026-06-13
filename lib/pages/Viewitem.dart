import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phoenix/Utils/class/itemBuyclass.dart';
import 'package:phoenix/Utils/helper/appbar.dart';
import 'package:phoenix/Utils/helper/ordersummary.dart';

class Viewitem extends StatefulWidget {
  const Viewitem({super.key});

  @override
  State<Viewitem> createState() => _ViewitemState();
}

class _ViewitemState extends State<Viewitem> {
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
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            /// IMAGE
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
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .06),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Image.network(
                'https://osama.alwaysdata.net/files/v1/download/${item.imageId}',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://cdn-icons-png.flaticon.com/512/616/616408.png',
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            /// NAME
            Text(
              item.itemName,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: height * 0.01),

            /// CATEGORY
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.sell, color: Color(0xfff0500a), size: 18),
                    Text(
                      item.categoryName,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: height * 0.01),

            /// DATE + CONDITION
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_rounded,
                        color: Color(0xfff0500a),
                        size: 18,
                      ),
                      Text(
                        DateFormat('dd MMM yyyy').format(item.time),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xfff0500a),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    item.condition,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),

            SizedBox(height: height * 0.03),

            /// PRICE
            Text(
              "${item.price} EGP",
              style: const TextStyle(color: Color(0xfff0500a), fontSize: 40),
            ),

            SizedBox(height: height * 0.02),

            /// LOCATION
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.grey),
                Text(item.userCity, style: const TextStyle(color: Colors.grey)),
              ],
            ),

            SizedBox(height: height * 0.03),

            /// DESCRIPTION
            const Text(
              'Product Description',
              style: TextStyle(color: Color(0xfff0500a), fontSize: 28),
            ),

            SizedBox(height: height * 0.01),

            Text(item.description),

            SizedBox(height: height * 0.04),

            /// USER CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: item.imageId != null
                            ? NetworkImage(
                                'https://osama.alwaysdata.net/files/v1/download/${item.imageId}',
                              )
                            : const AssetImage('assets/images/logo.jpeg')
                                  as ImageProvider,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        item.userName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(Icons.location_city, color: Color(0xfff0500a)),
                      const SizedBox(width: 5),
                      Text(
                        item.userGovernorate,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.05),

            /// CHAT
            Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [Color(0xfffec517), Color(0xfff43f06)],
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/chatpage',
                    arguments: item.userId,
                  );
                },
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.chat_outlined, color: Colors.white),
                      SizedBox(width: 5),
                      Text('Chat', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// BUY
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xfff43f06)),
              ),
              child: InkWell(
                onTap: () async {
                  final result = await showModalBottomSheet<String>(
                    context: context,
                    isScrollControlled: true,
                    builder: (ctx) => OrderSummarySheet(item: item),
                  );

                  // 👇 user closed sheet
                  if (result == null) return;

                  if (result == "success") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Payment Success ✅")),
                    );
                  } else if (result.contains("insufficient")) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("😢 Product will be available soon"),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('😢 Product will be available soon'),
                      ),
                    );
                  }
                },
                child: const Center(
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(color: Color(0xfff43f06), fontSize: 18),
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
