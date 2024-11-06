import 'package:event/feature/history/view/widgets/tab_card.dart';
import 'package:flutter/material.dart';

enum HistoryEnum { active, past }

class HistoryView extends StatelessWidget {
  HistoryView({
    this.historyEnum = HistoryEnum.active,
    Key? key,
  }) : super(key: key);

  HistoryEnum historyEnum;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: const Column(
        children: [
          TabCard(title: 'Konser Bruno Mars', location: 'Jakarta', datetime: ''),
          TabCard(title: 'Konser Bruno Mars', location: 'Surabaya', datetime: ''),
        ],
      ),
    );
  }
}
