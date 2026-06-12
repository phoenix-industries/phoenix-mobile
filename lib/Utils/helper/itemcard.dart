import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/itemBuyclass.dart';

class Itemcard extends StatelessWidget {
  final ItemBuyclass items;

  const Itemcard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              width: 0.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    items.imageId != null
                        ? 'https://osama.alwaysdata.net/files/v1/download/${items.imageId}'
                        : 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.15,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Image.network(
                        'https://cdn-icons-png.flaticon.com/512/616/616408.png',
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.15,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  items.itemName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  items.userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),

                const Spacer(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${items.price} EGP",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xfff43f06),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/itemview',
                          arguments: items,
                        );
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            colors: [Color(0Xfff8d402), Color(0xfff0500a)],
                          ),
                        ),
                        child: const Center(
                          child: Text('View', style: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        if (items.donated)
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "FREE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
