import 'package:flutter/material.dart';

class Categoriesbottem extends StatefulWidget {
  final Function(String) oncategoryslected;
  Categoriesbottem({super.key, required this.oncategoryslected});

  @override
  State<Categoriesbottem> createState() => CategoriesbottemState();
}

class CategoriesbottemState extends State<Categoriesbottem> {
  List<String> categories = [
    // "All Products",
    // "Electronics",
    // "Fashion",
    // "Home",
    // "Sports",
    // "Books",
    // "Toys",
    "beauty",
    "fragrances",
    "furniture",
    "groceries",
    "home-decoration",
    "kitchen-accessories",
    "laptops",
  ];
  String selectedCategory = "beauty";
  String getSelectedCategory() {
    return selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: categories.map((category) {
        bool isSelected = category == selectedCategory;
        return ChoiceChip(
          label: Text(category),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              selectedCategory = category;
            });
            widget.oncategoryslected(category);
          },
          selectedColor: Colors.orange,
          backgroundColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.orange,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.orange),
          ),
        );
      }).toList(),
    );
  }
}
