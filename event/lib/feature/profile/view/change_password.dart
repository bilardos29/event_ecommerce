import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/bottom_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController newPass = TextEditingController();
  TextEditingController newRePass = TextEditingController();

  bool showPass = false;
  bool showRePass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barChangePassword,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      bottomSheet: BottomButton(
          text: Strings.save,
          onClick: () {
            Navigator.of(context).pop();
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            const SizedBox(height: 20),
            RoundedTextField(
              prefix: Icons.lock_outline,
              onSuffix: () {
                setState(() {
                  showPass = !showPass;
                });
              },
              suffix: showPass
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye,
              obscureText: !showPass,
              hintText: Strings.newPassword,
              textController: newPass,
            ),
            const SizedBox(height: 20),
            RoundedTextField(
              prefix: Icons.lock_outline,
              onSuffix: () {
                setState(() {
                  showRePass = !showRePass;
                });
              },
              suffix: showRePass
                  ? Icons.remove_red_eye_outlined
                  : Icons.remove_red_eye,
              obscureText: !showRePass,
              hintText: Strings.newRePassword,
              textController: newPass,
            ),
          ],
        ),
      ),
    );
  }
}
