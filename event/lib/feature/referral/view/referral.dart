import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/icons_button.dart';
import 'package:event/widgets/main_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class ReferralPage extends StatefulWidget {
  const ReferralPage({Key? key}) : super(key: key);

  @override
  State<ReferralPage> createState() => _ReferralPageState();
}

class _ReferralPageState extends State<ReferralPage> {

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();

  String userCat = 'EO Member';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barReferral,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      bottomSheet: Container(
        height: 80,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            MainButton(
              text: Strings.buttonReferral,
              onClick: () {
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                RoundedTextField(
                  prefix: Icons.person,
                  hintText: 'First Name',
                  textController: firstname,
                ),
                const SizedBox(height: 16),
                RoundedTextField(
                  prefix: Icons.person,
                  hintText: 'Last Name',
                  textController: lastname,
                ),
                const SizedBox(height: 16),
                RoundedTextField(
                  prefix: Icons.email,
                  hintText: 'Email',
                  textController: email,
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 16,
                      right: 16, top: 12),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Member Category',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 4),
                      DropdownButton<String>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: <String>['EO Member', 'SLP', 'NextGen']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(fontSize: 12)),
                            onTap: () {
                              setState(() {
                                userCat = value;
                              });
                            },
                          );
                        }).toList(),
                        value: userCat,
                        onChanged: (_) {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
