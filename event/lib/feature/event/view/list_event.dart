import 'package:event/feature/event/view/detail_event.dart';
import 'package:event/feature/event/view/widgets/event_card.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:event/widgets/icons_button.dart';
import 'package:event/widgets/rounded_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListEvent extends StatefulWidget {
  const ListEvent({Key? key}) : super(key: key);

  @override
  State<ListEvent> createState() => _ListEventState();
}

class _ListEventState extends State<ListEvent> {
  TextEditingController eventName = TextEditingController();

  String eventCat = 'EO Member';

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

  void show() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              RoundedTextField(
                hintText: 'Location',
                textController: eventName,
                suffix: Icons.search,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: RoundedTextField(
                      hintText: 'Start Date',
                      textController: eventName,
                      suffix: Icons.calendar_month_outlined,
                      disabled: true,
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    ' - ',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: RoundedTextField(
                      hintText: 'End Date',
                      textController: eventName,
                      suffix: Icons.calendar_month_outlined,
                      disabled: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  underline: const SizedBox(),
                  hint: const Text('Event Category',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400)),
                  items: <String>['EO Member', 'SLP', 'NextGen']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(fontSize: 12)),
                      onTap: () {
                        setState(() {
                          eventCat = value;
                        });
                      },
                    );
                  }).toList(),
                  value: eventCat,
                  onChanged: (_) {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
