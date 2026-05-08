import 'package:flutter/material.dart';
import 'package:phoenix/Utils/helper/categoriesbottem.dart';
import 'package:phoenix/Utils/helper/itemcard.dart';
import 'package:phoenix/Utils/providers/itemprovider.dart';
import 'package:provider/provider.dart';
import 'package:phoenix/Utils/helper/appbar.dart';

class Marketpage extends StatefulWidget {
  const Marketpage({super.key});

  @override
  State<Marketpage> createState() => _MarketpageState();
}

class _MarketpageState extends State<Marketpage> {
  String selectedCategory = "beauty";
  final TextEditingController _searchitem = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Itemprovider>(
        context,
        listen: false,
      ).getitem(selectedCategory);
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
              'Marketplace',
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
              'Discover items donated or sold by the community near you',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _searchitem,
                decoration: InputDecoration(
                  hint: Text(
                    'Search for products....',
                    style: TextStyle(color: Color(0xfff0500a), fontSize: 14),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.onSurfaceVariant, width: 0.5),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  suffixIcon: Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [Color(0Xfff8d402), Color(0xfff0500a)],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text('Get it', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Categoriesbottem(
              oncategoryslected: (category) {
                setState(() {
                  selectedCategory = category;
                });
                Provider.of<Itemprovider>(
                  context,
                  listen: false,
                ).getitem(category);
              },
            ),
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
                    childAspectRatio: 0.7,
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
