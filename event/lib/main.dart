import 'package:event/feature/auth/controller/auth_controller.dart';
import 'package:event/feature/auth/view/login.dart';
import 'package:event/feature/dashboard/controller/dashboard_controller.dart';
import 'package:event/feature/event/controller/event_controller.dart';
import 'package:event/feature/history/controller/history_controller.dart';
import 'package:event/feature/member_benefit/controller/member_benefit_controller.dart';
import 'package:event/feature/notification/controller/notification_controller.dart';
import 'package:event/feature/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileController(),
        ),
        ChangeNotifierProvider(
          create: (context) => EventController(),
        ),
        ChangeNotifierProvider(
          create: (context) => MemberBenefitController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryController(),
        ),
      ],
      child: MaterialApp(
        title: 'Event',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: const Login(),
      ),
    );
  }
}