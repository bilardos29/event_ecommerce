import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/main_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  FilterWidget(
      {required this.location,
      required this.startDate,
      required this.endDate,
      required this.listDropdown,
      required this.dropdownItem,
      Key? key})
      : super(key: key);

  TextEditingController location;
  TextEditingController startDate;
  TextEditingController endDate;
  List<String> listDropdown;
  String dropdownItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const Text(
            'Filter',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          RoundedTextField(
            hintText: 'Location',
            textController: location,
            prefix: Icons.search,
          ),
          const SizedBox(height: 12),
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
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              underline: const SizedBox(),
              hint: const Text('Event Category',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400)),
              items: listDropdown.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(fontSize: 12)),
                  onTap: () {
                    dropdownItem = value;
                  },
                );
              }).toList(),
              value: dropdownItem,
              onChanged: (_) {},
            ),
          ),
          const SizedBox(height: 16),
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
//<String>['EO Member', 'SLP', 'NextGen']
