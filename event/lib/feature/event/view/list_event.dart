import 'package:event/feature/event/model/event_category_model.dart';
import 'package:event/feature/event/model/event_model.dart';
import 'package:event/feature/event/view/detail_event.dart';
import 'package:event/feature/event/view/widgets/event_card.dart';
import 'package:event/widgets/filter_widget.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/icons_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/material.dart';

class ListEvent extends StatefulWidget {
  const ListEvent({Key? key}) : super(key: key);

  @override
  State<ListEvent> createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {
  TextEditingController eventName = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  String eventCat = 'All';

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
              Row(
                children: [
                  RoundedTextField(
                    width: MediaQuery.of(context).size.width - 80,
                    prefix: Icons.search,
                    hintText: 'Event Name',
                    textController: eventName,
                  ),
                  const SizedBox(width: 8),
                  IconsButton(
                    icon: 'ic_filter.png',
                    onClick: show,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listEvent.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                  ),
                  itemBuilder: (ctx, idx) {
                    return EventCard(
                      item: listEvent[idx],
                      onClick: () {
                        BaseWidget.push(ctx, DetailEvent(item: listEvent[idx]));
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  void show() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FilterWidget(
          listDropdown: listEventCategory,
          location: location,
          startDate: startDate,
          endDate: endDate,
          dropdownItem: eventCat,
        );
      },
    );
  }
}
