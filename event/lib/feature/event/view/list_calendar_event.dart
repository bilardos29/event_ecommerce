import 'package:event/feature/event/model/event_model.dart';
import 'package:event/feature/event/view/detail_event.dart';
import 'package:event/feature/event/view/widgets/event_card.dart';
import 'package:event/widgets/calendar_plus.dart';
import 'package:event/utils/strings.dart';
import 'package:event/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
              SfCalendar(
                view: CalendarView.month,
                allowedViews: const <CalendarView>[
                  CalendarView.week,
                  CalendarView.month,
                  CalendarView.timelineMonth,
                  CalendarView.schedule
                ],
                headerHeight: 48,
                scheduleViewSettings: const ScheduleViewSettings(
                    monthHeaderSettings: MonthHeaderSettings(
                        height: 68,
                        backgroundColor: Color(0xff3D45F2))),
                dataSource: MeetingDataSource(_getDataSource()),
                monthViewSettings: const MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment),
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
                        BaseWidget.push(
                            ctx,
                            DetailEvent(
                              item: listEvent[idx],
                            ));
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day - 1, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    print('${today.day}');
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
