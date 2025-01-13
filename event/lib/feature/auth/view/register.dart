import 'package:event/feature/auth/controller/register_controller.dart';
import 'package:event/feature/auth/model/user_category_model.dart';
import 'package:event/feature/auth/view/login.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/feature/auth/view/widgets/header_label.dart';
import 'package:event/widgets/main_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  late RegisterController controller = context.watch<RegisterController>();

  bool showPass = false;
  bool showRepass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 80,
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
                  const SizedBox(height: 20),
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
                          items: listUserCat.map((UserCategoryModel item) {
                            return DropdownMenuItem<String>(
                              value: item.name,
                              child: Text(item.name!,
                                  style: const TextStyle(fontSize: 12)),
                              onTap: () {
                                controller.updateUserCat(item);
                              },
                            );
                          }).toList(),
                          value: controller.userCat.name,
                          onChanged: (_) {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
