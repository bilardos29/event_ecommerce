import 'package:event/utils/strings.dart';
import 'package:flutter/material.dart';

class CardSaldo extends StatelessWidget {
  const CardSaldo({
    required this.price,
    required this.isShowSaldo,
    required this.onShowSaldo,
    Key? key,
  }) : super(key: key);

  final String price;
  final VoidCallback onShowSaldo;
  final bool isShowSaldo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Rp ${isShowSaldo ? price : ''}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              !isShowSaldo ? const TextHidden() : const SizedBox(),
            ],
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onShowSaldo,
            child: Row(
              children: [
                const Text(
                  Strings.lihatSaldo,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(width: 8),
                Icon(
                  isShowSaldo
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextHidden extends StatelessWidget {
  const TextHidden({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 7,
          itemBuilder: (ctx, idx) => dot),
    );
  }

  Widget get dot => Container(
        height: 12,
        width: 12,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
      );
}
