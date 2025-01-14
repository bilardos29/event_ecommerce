import 'package:event/feature/event/model/event_model.dart';
import 'package:event/feature/event/view/detail_event.dart';
import 'package:event/feature/event/view/widgets/event_card.dart';
import 'package:event/widgets/calendar_plus.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class ListCalendarEvent extends StatefulWidget {
  const ListCalendarEvent({Key? key}) : super(key: key);

  @override
  State<ListCalendarEvent> createState() => _ListCalendarEventState();
}

class _ListCalendarEventState extends State<ListCalendarEvent> {
  TextEditingController eventName = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();

  String eventCat = 'EO Member';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double itemHeight = 230;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: BaseWidget.appbar(
          title: Strings.barEventCalendar,
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
              Container(
                margin: const EdgeInsets.only(top: 7),
                child: CalendarPlus(
                  rowHeight: 60,
                  selectedDate: DateTime.now(),
                  onSelectedDate: (selectedDay) {
                    // controller.selectedDate(selectedDay);
                    // controller.initSelectedCalendar();
                  },
                  onPageChanged: (focusedDay) async {
                    // controller.selectedDate(focusedDay);
                    // await controller.initWorkingCalendar();
                  },
                  markers: const [
                    // ...controller.workingCalendars.map(
                    //       (value) => CalendarMarkerAdapter(
                    //     date: value.tanggal,
                    //     isHoliday: value.libur.isNotEmpty == true,
                    //     widget: WorkingCalendarMarkers(
                    //       calendar: value,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
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
                        BaseWidget.push(ctx, DetailEvent(item: listEvent[idx],));
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
