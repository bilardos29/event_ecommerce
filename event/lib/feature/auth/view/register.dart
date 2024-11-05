import 'package:event/feature/auth/controller/auth_controller.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/feature/auth/view/widgets/header_label.dart';
import 'package:event/widgets/main_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:event/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/bg_card.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController repass = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();

  late AuthController controller = context.read<AuthController>();

  bool showPass = false;
  bool showRepass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 120,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            MainButton(
              text: Strings.register,
              onClick: () {
                controller.register(email.text, firstname.text, lastname.text,
                    pass.text, repass.text, onError: (err) {
                  BaseWidget.showSnackBar(context, err);
                }, onSuccess: () {
                  // BaseWidget.pushToTop(context, const LoginPage());
                });
              },
            ),
            const SizedBox(height: 12),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text(
            //       Strings.registerNote,
            //       textAlign: TextAlign.center,
            //       style: TextStyle(fontSize: 12, color: Colors.black45),
            //     ),
            //     const SizedBox(width: 4),
            //     TextButtons(
            //       Strings.disini,
            //       onClick: () {
            //         // BaseWidget.pushToTop(context, const LoginPage());
            //       },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      body: Stack(
        children: [
          const BackgroundCard(),
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
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  HeaderLabel(
                    header: Strings.registerHeader,
                    detail: Strings.registerHeaderDetail,
                  ),
                  const SizedBox(height: 50),
                  RoundedTextField(
                    prefix: Icons.alternate_email_outlined,
                    hintText: Strings.registerEmail,
                    textController: email,
                  ),
                  const SizedBox(height: 20),
                  RoundedTextField(
                    prefix: Icons.person,
                    hintText: Strings.namaDepan,
                    textController: firstname,
                  ),
                  const SizedBox(height: 20),
                  RoundedTextField(
                    prefix: Icons.person,
                    hintText: Strings.namaBelakang,
                    textController: lastname,
                  ),
                  const SizedBox(height: 20),
                  RoundedTextField(
                    prefix: Icons.lock_outline,
                    suffix: showPass
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                    hintText: Strings.buatPassword,
                    textController: pass,
                    obscureText: !showPass,
                    onSuffix: () {
                      setState(() {
                        showPass = !showPass;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  RoundedTextField(
                    prefix: Icons.lock_outline,
                    suffix: showRepass
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
                    hintText: Strings.konfirmasiPassword,
                    textController: repass,
                    obscureText: !showRepass,
                    onSuffix: () {
                      setState(() {
                        showRepass = !showRepass;
                      });
                    },
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
