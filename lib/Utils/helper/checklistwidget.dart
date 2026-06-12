import 'package:flutter/material.dart';


class PasswordChecklist extends StatelessWidget {
  final String password;

  const PasswordChecklist({super.key, required this.password});

  bool hasUppercase(String text) => text.contains(RegExp(r'[A-Z]'));
  bool hasLowercase(String text) => text.contains(RegExp(r'[a-z]'));
  bool hasNumber(String text) => text.contains(RegExp(r'[0-9]'));
  bool hasSpecialChar(String text) => text.contains(RegExp(r'[!@#$%^&*]'));
  bool hasMinLength(String text) => text.length >= 8;

  Widget buildRequirement(String text, bool satisfied) {
    return Row(
      children: [
        Icon(
          satisfied ? Icons.circle : Icons.circle,
          color: satisfied ? Colors.green : Colors.red,
          size: 14,
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border:  Border.all(color: Theme.of(context).colorScheme.outline,),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildRequirement('At least 8 characters', hasMinLength(password)),
          buildRequirement('Contains uppercase letter', hasUppercase(password)),
          buildRequirement('Contains lowercase letter', hasLowercase(password)),
          buildRequirement('Contains number', hasNumber(password)),
          buildRequirement('Contains special character (!@#%^&)', hasSpecialChar(password)),
        ],
      ),
    );
  }
}
