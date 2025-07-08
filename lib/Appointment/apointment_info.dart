import 'package:flutter/material.dart';

class AppointmentInfo extends StatelessWidget {
  final String leadingText, trailingText;
  final IconData icon;

  const AppointmentInfo({
    super.key,
    required this.leadingText,
    required this.trailingText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Row(
        children: [
          Text(
            leadingText,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Text(
            trailingText,
            style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 142, 142, 142),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(width: 10),
          Icon(icon, size: 16, color: Color.fromARGB(255, 131, 131, 131)),
        ],
      ),
    );
  }
}
