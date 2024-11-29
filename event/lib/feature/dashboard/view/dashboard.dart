import 'package:event/feature/dashboard/view/home.dart';
import 'package:event/feature/history/view/history.dart';
import 'package:event/feature/notification/view/notification.dart';
import 'package:event/feature/profile/view/profile.dart';
import 'package:event/feature/dashboard/controller/dashboard_controller.dart';
import 'package:event/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late DashboardController controller = context.watch<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.page == 0
          ? const HomePage()
          : controller.page == 1
              ? const HistoryPage()
              : controller.page == 3
                  ? const NotificationPage()
                  : controller.page == 4
                      ? const ProfilePage()
                      : Container(),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 62,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MenuIcon(
                    icons: Icons.home,
                    menu: 'Home',
                    isActive: controller.page == 0,
                    onClick: () {
                      setState(() {
                        controller.page = 0;
                      });
                    }),
                MenuIcon(
                    icons: Icons.history,
                    menu: 'My Events',
                    isActive: controller.page == 1,
                    onClick: () {
                      setState(() {
                        controller.page = 1;
                      });
                    }),
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(72),
                    color: Colors.white,
                    border: Border.all(width: 3, color: Colors.grey[200]!),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    height: 56,
                    width: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(56),
                      color: ColorsUtil.mainButton,
                    ),
                    child: const Icon(
                      Icons.qr_code,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
                MenuIcon(
                    icons: Icons.notifications,
                    menu: 'Inbox',
                    isActive: controller.page == 3,
                    onClick: () {
                      setState(() {
                        controller.page = 3;
                      });
                    }),
                MenuIcon(
                    icons: Icons.person,
                    menu: 'Profile',
                    isActive: controller.page == 4,
                    onClick: () {
                      setState(() {
                        controller.page = 4;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  const MenuIcon({
    required this.icons,
    required this.menu,
    this.isActive = false,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  final IconData icons;
  final String menu;
  final bool isActive;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: SizedBox(
        height: 50,
        width: 60,
        child: Column(
          children: [
            Icon(
              icons,
              size: 24,
              color: isActive ? ColorsUtil.mainButton : Colors.black38,
            ),
            const SizedBox(height: 2),
            Text(
              menu,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? ColorsUtil.mainButton : Colors.black38,
              ),
            )
          ],
        ),
      ),
    );
  }
}
