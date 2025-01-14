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
          TabCard(
              bookingId: '112122123134',
              title: 'The Haunting Of The Seven Seas',
              location: 'Jakarta',
              datetime: '16 November 2024'),
          TabCard(
              bookingId: '112122123135',
              title: 'Transform Marketing & Sales',
              location: 'Jakarta',
              datetime: '07 November 2024'),
        ],
      ),
    );
  }
}
