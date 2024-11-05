import 'package:event/feature/auth/controller/auth_controller.dart';
import 'package:event/feature/auth/view/forgot_password.dart';
import 'package:event/feature/auth/view/register.dart';
import 'package:event/feature/auth/view/widgets/bg_card.dart';
import 'package:event/feature/dashboard/view/dashboard.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/feature/auth/view/widgets/header_label.dart';
import 'package:event/widgets/main_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:event/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AuthController controller = context.read<AuthController>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 120,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(children: [
          MainButton(
            text: Strings.login,
            onClick: () {
              controller.login(email.text, pass.text, onError: (err) {
                BaseWidget.showSnackBar(context, err);
              }, onSuccess: () {
                // context.read<HomeController>().updateToken(val);
                BaseWidget.pushToTop(context, const Dashboard());
              });
            },
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                Strings.registerNote,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(width: 4),
              TextButtons(
                Strings.registerNote2,
                onClick: () {
                  BaseWidget.push(context, const Register());
                },
              ),
            ],
          ),
        ]),
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
                  const SizedBox(height: 150),
                  HeaderLabel(
                    header: Strings.loginHeader,
                    detail: Strings.loginHeaderDetail,
                  ),
                  const SizedBox(height: 50),
                  RoundedTextField(
                    prefix: Icons.alternate_email_outlined,
                    hintText: Strings.loginEmail,
                    textController: email,
                  ),
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
                    hintText: Strings.loginPassword,
                    textController: pass,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButtons(
                        Strings.forgotPassword,
                        size: 14,
                        onClick: () {
                          BaseWidget.push(context, const ForgotPassword());
                        },
                      ),
                    ],
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
