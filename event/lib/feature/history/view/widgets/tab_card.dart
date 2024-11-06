import 'package:flutter/material.dart';

enum TabEnum { ongoing, canceled, onreview, completed }

class TabCard extends StatelessWidget {
  const TabCard({
    required this.title,
    required this.location,
    required this.datetime,
    this.tabEnum = TabEnum.ongoing,
    Key? key,
  }) : super(key: key);

  final String title;
  final String location;
  final String datetime;
  final TabEnum tabEnum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          newText('Booking ID: 112211223300'),
          const SizedBox(height: 2),
          newText(title, isHeader: true),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.place,
                size: 20,
                color: Colors.grey.withOpacity(0.8),
              ),
              const SizedBox(width: 2),
              newText('$location | 23 Februari 2024'),
            ],
          ),
          const SizedBox(height: 10),
          newText('Completed', color: Colors.green),
          // newText('Canceled', color: Colors.red),
        ],
      ),
    );
  }

  Text newText(String txt,
      {bool isHeader = false, Color color = Colors.black87}) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: isHeader ? 20 : 12,
        color: isHeader ? Colors.black : color,
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
