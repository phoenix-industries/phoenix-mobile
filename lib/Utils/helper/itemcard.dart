import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/itemBuyclass.dart';

class Itemcard extends StatelessWidget {
  final ItemBuyclass item;
  const Itemcard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Theme.of(context).cardColor,
        border: Border.all(color: Theme.of(context).colorScheme.onSurfaceVariant, width: 0.5),
      ),
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              border: Border.all(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              width: 0.5,
             ),
             ),
            child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
             child: Image.network(
            item.images[0],
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15, // fixed height
            fit: BoxFit.cover,
             ),
             ),
               ),

            const SizedBox(height: 8),
            Text(
              item.itemName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              item.personName,
              style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${item.price} EGP",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, color: Color(0xfff43f06)),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                  width: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [Color(0Xfff8d402), Color(0xfff0500a)],
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/itemview',
                        arguments: item,
                      );
                    },
                    child: Center(
                      child: Text('View', style: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
