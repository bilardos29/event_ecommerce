import 'package:flutter/material.dart';

class HeaderLabel extends StatelessWidget {
  HeaderLabel({
    this.header,
    this.detail,
    Key? key,
  }) : super(key: key);

  String? header;
  String? detail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header ?? '',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              detail ?? '',
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ]),
    );
  }
}
