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
          backgroundColor: ColorsUtil.primaryBg,
          title: const Text(
            Strings.barHistory,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          bottom: const TabBar(indicatorColor: Colors.white, tabs: [
            Tab(
              child: Text(
                'Active',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                'Past',
                style: TextStyle(fontSize: 16, color: Colors.white),
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
