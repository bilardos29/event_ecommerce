import 'package:event/feature/dashboard/view/home.dart';
import 'package:event/feature/history/view/history.dart';
import 'package:event/feature/notification/view/notification.dart';
import 'package:event/feature/profile/view/profile.dart';
import 'package:event/feature/dashboard/controller/dashboard_controller.dart';
import 'package:event/utils/colors.dart';
import 'package:event/utils/strings.dart';
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
              : controller.page == 2
                  ? const NotificationPage()
                  : const ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: ColorsUtil.mainButton,
          unselectedItemColor: Colors.black26,
          currentIndex: controller.page,
          onTap: (idx) {
            setState(() {
              controller.changePage(idx);
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: Strings.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: Strings.history,
            ),
            BottomNavigationBarItem(
              icon: Badge(
                child: Icon(Icons.notifications),
                label: Text('1'),
              ),
              label: Strings.notification,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: Strings.profile,
            ),
          ]),
    );
  }
}
