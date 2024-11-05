import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({
    required this.title,
    required this.detail,
    required this.date,
    Key? key,
  }) : super(key: key);

  final String date;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon(),
              const SizedBox(width: 10),
              newText('Information | 23 Februari 2024'),
            ],
          ),
          const SizedBox(height: 12),
          newText(title, isHeader: true),
          const SizedBox(height: 2),
          newText(detail),
        ],
      ),
    );
  }

  Widget icon() {
    return Container(
      height: 28,
      width: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.grey.withOpacity(0.25),
      ),
      child: const Text(
        '!',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  Text newText(String txt, {bool isHeader = false}) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: isHeader ? 20: 12,
        color: isHeader ? Colors.black : Colors.black87,
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
