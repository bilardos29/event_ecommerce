import 'package:event/feature/history/view/widgets/history_view.dart';
import 'package:event/utils/colors.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            Strings.barHistory,
            style: TextStyle(
              color: ColorsUtil.mainButton,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: const TabBar(indicatorColor: ColorsUtil.mainButton, tabs: [
            Tab(
              child: Text(
                'Active',
                style: TextStyle(fontSize: 16, color: ColorsUtil.mainButton),
              ),
            ),
            Tab(
              child: Text(
                'Past',
                style: TextStyle(fontSize: 16, color: ColorsUtil.mainButton),
              ),
            ),
          ]),
        ),
        body: TabBarView(children: [
          HistoryView(
            historyEnum: HistoryEnum.active,
          ),
          HistoryView(
            historyEnum: HistoryEnum.past,
          ),
        ]),
      ),
    );
  }
}
