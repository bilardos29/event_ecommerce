import 'package:event/feature/auth/view/login.dart';
import 'package:event/feature/profile/controller/profile_controller.dart';
import 'package:event/feature/profile/view/widgets/menu_view.dart';
import 'package:event/utils/colors.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/secondary_button.dart';
import 'package:event/widgets/user_profile_big.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileController controller = context.read<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorsUtil.primaryBg,
      ),
      bottomSheet: Container(
        height: 100,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            SecondaryButton(
                text: 'Log Out', //controller.secondaryText,
                onClick: () {
                  BaseWidget.pushToTop(context, const Login());
                }),
          ],
        ),
      ),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(child: UserProfileBig()),
              const SizedBox(height: 12),
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Bilardo Situmorang',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'bilardo.situmorang@gmail.com',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '082130427985',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              MenuView(
                menu: 'Profile Information',
                iconMenu: Icons.person,
                onClick: () {},
              ),
              const SizedBox(height: 6),
              MenuView(
                menu: 'Change Password',
                iconMenu: Icons.lock,
                onClick: () {},
              ),
              const SizedBox(height: 6),
              MenuView(
                menu: 'FAQ',
                iconMenu: Icons.question_answer,
                onClick: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
