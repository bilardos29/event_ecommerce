import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
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
  TextEditingController phone = TextEditingController();

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
                Navigator.of(context).pop();
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
                RoundedTextField(
                  prefix: Icons.phone,
                  hintText: 'Phone Number',
                  textController: phone,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
