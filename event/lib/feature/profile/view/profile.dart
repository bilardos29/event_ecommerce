import 'package:event/feature/auth/view/login.dart';
import 'package:event/feature/dashboard/controller/dashboard_controller.dart';
import 'package:event/feature/profile/controller/profile_controller.dart';
import 'package:event/feature/profile/view/change_interest.dart';
import 'package:event/feature/profile/view/change_password.dart';
import 'package:event/feature/profile/view/detail_profile.dart';
import 'package:event/feature/profile/view/widgets/menu_view.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/bottom_button.dart';
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
  late DashboardController homeController = context.read<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(title: Strings.barProfile),
      bottomSheet: BottomButton(
          bottomEnum: BottomEnum.secondary,
          text: Strings.logout,
          onClick: () {
            homeController.logout();
            BaseWidget.pushToTop(context, const Login());
          }),
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(child: UserProfileBig()),
              const SizedBox(height: 12),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${homeController.user!.firstname} ${homeController.user!.lastname}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${homeController.user!.email}',
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      '${homeController.user!.phone}',
                      style: const TextStyle(
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
                onClick: () {
                  BaseWidget.push(context, const DetailProfile());
                },
              ),
              const SizedBox(height: 6),
              MenuView(
                menu: 'Change Password',
                iconMenu: Icons.lock,
                onClick: () {
                  BaseWidget.push(context, const ChangePassword());
                },
              ),
              const SizedBox(height: 6),
              MenuView(
                menu: 'Change Interest',
                iconMenu: Icons.interests,
                onClick: () {
                  BaseWidget.push(context, const ChangeInterest());
                },
              ),
              const SizedBox(height: 6),
              MenuView(
                menu: 'FAQ',
                iconMenu: Icons.question_answer,
                onClick: () {},
              ),
              const SizedBox(height: 6),
              MenuView(
                menu: 'Contact Us',
                iconMenu: Icons.phone,
                onClick: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
