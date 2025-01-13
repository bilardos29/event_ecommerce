import 'package:event/feature/auth/controller/auth_controller.dart';
import 'package:event/feature/auth/view/login.dart';
import 'package:event/feature/auth/view/widgets/header_label.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/main_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late AuthController controller = context.read<AuthController>();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: Colors.white,
        child: Column(
          children: [
            MainButton(
              text: Strings.send,
              onClick: () {
                controller.forgotPassword(email.text, onError: (err) {
                  BaseWidget.showSnackBar(context, err);
                }, onSuccess: () {
                  BaseWidget.pushToTop(context, const Login());
                });
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  const SizedBox(height: 56),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  HeaderLabel(
                    header: Strings.forgotHeader,
                    detail: Strings.forgotHeaderDetail,
                  ),
                  const SizedBox(height: 30),
                  RoundedTextField(
                    prefix: Icons.alternate_email_outlined,
                    hintText: Strings.forgotEmail,
                    textController: email,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
