import 'package:event/utils/strings.dart';
import 'package:flutter/material.dart';

class CardSaldoSmall extends StatelessWidget {
  const CardSaldoSmall({required this.price, Key? key}) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/assets/ic_background_saldo.png'),
            fit: BoxFit.fill,
          )),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            Strings.saldoAnda,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Text(
            'Rp $price',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
