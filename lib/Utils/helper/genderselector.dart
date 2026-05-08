import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String initialGender;

  const GenderSelector({
    super.key,
    required this.onChanged,
    this.initialGender = "Male",
  });

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialGender;
  }

  Widget buildGenderButton(String gender, IconData icon) {
    final bool isSelected = selectedGender == gender;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedGender = gender;
          });
          widget.onChanged(selectedGender);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xfff0500a) : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1.5),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(height: 8),
              Text(
                gender,
                style: TextStyle(
                  color: isSelected ? Colors.white : Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1.5),
      ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding:const EdgeInsets.only(left: 115)
         ,child: Text(
          "Gender",
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 16,),
        ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            buildGenderButton("Male", Icons.male,),
            buildGenderButton("Female", Icons.female,),
          ],
        ),
      ],
    )
    );
  }
}
