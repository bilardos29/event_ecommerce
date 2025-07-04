import 'package:event/feature/notification/view/widgets/notification_view.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseWidget.appbar(title: Strings.barNotification),
      backgroundColor: Colors.grey.withOpacity(0.12),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            NotificationView(
              title: 'Hari Raya Idul Fitri',
              detail:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lacinia pellentesque lacinia ',
              date: '23 Feb',
            ),
            NotificationView(
              title: 'Hari Raya Idul Fitri',
              detail:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lacinia pellentesque lacinia ',
              date: '23 Feb',
            ),
            NotificationView(
              title: 'Hari Raya Idul Fitri',
              detail:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lacinia pellentesque lacinia ',
              date: '23 Feb',
            ),
          ],
        ),
      ),
    );
  }
}
