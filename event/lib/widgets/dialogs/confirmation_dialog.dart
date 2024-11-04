import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    required this.title,
    required this.detail,
    required this.onYes,
    required this.onNo,
    Key? key,
  }) : super(key: key);

  final String title;
  final String detail;
  final VoidCallback onYes;
  final VoidCallback onNo;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 340,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            iconImage(),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 2),
            Text(
              detail,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: onYes,
                child: const Text(
                  'Ya, lanjutkan Bayar',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            TextButton(
                onPressed: onNo,
                child: Text(
                  'Batalkan',
                  style: TextStyle(
                    color: Colors.grey[400]!,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ))
          ],
        ));
  }

  Widget iconImage() {
    return Image.asset(
      'images/assets/ic_logo.png',
      height: 52,
      width: 52,
    );
  }
}
