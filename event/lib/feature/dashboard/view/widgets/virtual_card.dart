import 'package:flutter/material.dart';

class VirtualCard extends StatelessWidget {
  const VirtualCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bilardo Situmorang',
            style: TextStyle(
                color: Color(0xffa67c00),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          Text(
            '1234 0012 0000 1234',
            style: TextStyle(
                color: Color(0xffa67c00),
                fontSize: 24,
                fontFamily: 'Mono',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Valid Until',
                    style: TextStyle(
                        color: Color(0xffa67c00),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '11/24',
                    style: TextStyle(
                        color: Color(0xffa67c00),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Icon(
                Icons.qr_code,
                color: Colors.white,
                size: 28,
              )
            ],
          ),
        ],
      ),
    );
  }
}
