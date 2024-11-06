import 'package:event/feature/event/view/detail_event.dart';
import 'package:event/feature/event/view/widgets/event_card.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/bottom_button.dart';
import 'package:flutter/material.dart';

class ListEvent extends StatefulWidget {
  const ListEvent({Key? key}) : super(key: key);

  @override
  State<ListEvent> createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemHeight = 230;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barEvent,
          onBack: () {
            Navigator.of(context).pop();
          },
          withBackAction: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemBuilder: (ctx, idx) {
                    return EventCard(
                      onClick: () {
                        BaseWidget.push(ctx, const DetailEvent());
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
