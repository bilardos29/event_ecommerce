import 'package:event/utils/colors.dart';
import 'package:flutter/material.dart';

enum AlertEnum { success, failed }

class AlertDialogs extends StatelessWidget {
  const AlertDialogs({
    required this.title,
    required this.detail,
    required this.onClose,
    this.alertEnum = AlertEnum.success,
    Key? key,
  }) : super(key: key);

  final String title;
  final String detail;
  final AlertEnum alertEnum;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    bool isSuccess = alertEnum == AlertEnum.success;

    return Container(
        height: 270,
        width: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            iconImage(isSuccess),
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
            const SizedBox(height: 4),
            Text(
              isSuccess ? 'berhasil!' : 'gagal',
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: onClose,
                child: const Text(
                  'Kembali ke Beranda',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ))
          ],
        ));
  }

  Widget iconImage(bool isSuccess) {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(52),
        color: isSuccess ? ColorsUtil.success : ColorsUtil.error,
      ),
      alignment: Alignment.center,
      child: Icon(
        isSuccess ? Icons.check : Icons.close,
        color: Colors.white,
        size: 32,
      ),
    );
  }
}
