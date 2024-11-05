import 'package:event/widgets/main_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({Key? key}) : super(key: key);

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {

  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  // void updateInputText() {
  //   email.text = homeController.user.email ?? '';
  //   firstName.text = homeController.user.firstName ?? '';
  //   lastName.text = homeController.user.lastName ?? '';
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('Email'),
        const SizedBox(height: 12),
        RoundedTextField(
          textController: email,
          prefix: Icons.alternate_email,
          disabled: true,
        ),
        const SizedBox(height: 20),
        const Text('Nama Depan'),
        const SizedBox(height: 12),
        RoundedTextField(
          textController: firstName,
          prefix: Icons.person,
          disabled: true,//controller.mainText != Strings.simpan,
        ),
        const SizedBox(height: 20),
        const Text('Nama Belakang'),
        const SizedBox(height: 12),
        RoundedTextField(
          textController: lastName,
          prefix: Icons.person,
          disabled: true,//controller.mainText != Strings.simpan,
        ),
        const SizedBox(height: 40),
        MainButton(
            text: 'Update',//controller.mainText,
            onClick: () {
              // controller.updateProfile(
              //     firstName.text, lastName.text,
              //     onUnauthorized: () {},
              //     onError: (err) {},
              //     onSuccess: (user) {
              //       homeController.updateUser(user);
              //     });
            }),
      ],),
    );
  }
}
