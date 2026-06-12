import 'package:flutter/material.dart';
import 'package:phoenix/Utils/class/categoryClass.dart';

class Categoriesbottem extends StatelessWidget {
  final List<Categoryclass> categories;
  final String selectedCategory;
  final Function(String) oncategoryslected;

  const Categoriesbottem({
    super.key,
    required this.categories,
    required this.oncategoryslected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: categories.map((category) {
        final isSelected = category.id == selectedCategory;

        return ChoiceChip(
          label: Text(category.name),
          selected: isSelected,
          onSelected: (_) {
            if (category.id == selectedCategory) return;

            oncategoryslected(category.id);
          },
          selectedColor: const Color(0xfff0500a),
          backgroundColor: Theme.of(context).cardColor,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : const Color(0xfff0500a),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Color(0xfff0500a)),
          ),
        );
      }).toList(),
    );
  }
}
