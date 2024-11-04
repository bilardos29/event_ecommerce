import 'package:flutter/material.dart';

enum TransactionEnum { debit, credit }

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    required this.price,
    required this.action,
    required this.datetime,
    this.transactionEnum = TransactionEnum.debit,
    Key? key,
  }) : super(key: key);

  final TransactionEnum transactionEnum;
  final String price;
  final String action;
  final String datetime;

  @override
  Widget build(BuildContext context) {
    bool isDebit = transactionEnum == TransactionEnum.debit;

    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${isDebit ? '+' : '-'} Rp.$price',
                style: TextStyle(
                  color: isDebit ? Colors.green : Colors.redAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(action, style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Text(datetime,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[400]!,
              )),
        ],
      ),
    );
  }
}
