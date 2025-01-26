import 'package:event/widgets/main_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class FilterAnnouncement extends StatelessWidget {
  FilterAnnouncement({
    required this.startDate,
    required this.endDate,
    Key? key,
  }) : super(key: key);

  TextEditingController startDate;
  TextEditingController endDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'Filter',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: RoundedTextField(
                  hintText: 'Start Date',
                  textController: startDate,
                  suffix: Icons.calendar_month_outlined,
                  disabled: true,
                ),
              ),
              const SizedBox(width: 20),
              const Text(
                ' - ',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: RoundedTextField(
                  hintText: 'End Date',
                  textController: endDate,
                  suffix: Icons.calendar_month_outlined,
                  disabled: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          MainButton(
            text: 'Apply',
            onClick: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
