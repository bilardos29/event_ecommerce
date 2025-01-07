import 'package:event/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPlus extends StatefulWidget {
  const CalendarPlus({
    super.key,
    this.firstDate,
    this.lastDate,
    required this.selectedDate,
    this.onSelectedDate,
    this.onPageChanged,
    this.rowHeight,
    required this.markers,
  });
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime selectedDate;
  final double? rowHeight;
  final List<CalendarMarkerAdapter> markers;
  final Function(DateTime selectedDayy)? onSelectedDate;
  final Function(DateTime focusedDay)? onPageChanged;

  @override
  State<CalendarPlus> createState() => _CalendarPlusState();
}

class _CalendarPlusState<T> extends State<CalendarPlus> {
  DateTime _focusedDay = DateTime.now();
  PageController? calendarController;
  @override
  void initState() {
    super.initState();
    _focusedDay = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: (){},//_showMonthOnlyPicker,
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 7),
                          child: Icon(
                            Icons.calendar_today,
                            size: 20,
                          ),
                        ),
                        Text(
                          DateFormat('MMMM yyyy').format(_focusedDay),
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      calendarController?.previousPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.linear,
                      );
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      calendarController?.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.linear,
                      );
                    },
                    icon: Icon(
                      Icons.chevron_right,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TableCalendar<CalendarMarkerAdapter>(
              daysOfWeekStyle: DaysOfWeekStyle(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300),
                    // bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                weekdayStyle: const TextStyle(color: Colors.grey),
                weekendStyle: TextStyle(color: Colors.red.withOpacity(0.5)),
              ),
              daysOfWeekHeight: 30,
              firstDay: widget.firstDate ??
                  DateTime.now().subtract(const Duration(days: 365 * 2)),
              lastDay: widget.lastDate ??
                  DateTime.now().add(const Duration(days: 365 * 2)),
              selectedDayPredicate: (day) {
                return isSameDay(_focusedDay, day);
              },
              focusedDay: _focusedDay,
              // locale: widget.local,
              onCalendarCreated: (pageController) =>
              calendarController = pageController,

              eventLoader: (day) {
                final list = <CalendarMarkerAdapter>[];
                for (var marker in widget.markers) {
                  if (isSameDay(marker.date, day)) {
                    list.add(marker);
                    break;
                  }
                }
                return list;
              },
              headerVisible: false,
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              availableGestures: AvailableGestures.horizontalSwipe,
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(selectedDay, _focusedDay)) {
                  setState(() {
                    _focusedDay = selectedDay;
                  });
                  if (widget.onSelectedDate != null) {
                    widget.onSelectedDate!(selectedDay);
                  }
                }
              },
              onPageChanged: (focusedDay) {
                if (widget.onPageChanged != null) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                  widget.onPageChanged!(focusedDay);
                }
              },
              rowHeight: widget.rowHeight ?? 50,

              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, date, focusedDay) {
                  CalendarMarkerAdapter? markerDate;
                  for (var marker in widget.markers) {
                    if (isSameDay(marker.date, date)) {
                      markerDate = marker;
                      break;
                    }
                  }
                  return CalendarDay(
                    date: date,
                    marker: markerDate,
                  );
                },
                selectedBuilder: (context, date, focusedDay) => CalendarDay(
                  date: date,
                  color: ColorsUtil.mainButton,
                  isSelected: true,
                ),
                todayBuilder: (context, date, focusedDay) => CalendarDay(
                  date: date,
                  color: Colors.amber,
                ),
                markerBuilder: (context, day, events) {
                  return events.firstOrNull?.widget ?? Container();
                },
              ),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  // _showMonthOnlyPicker() async {
  //   final selectedDate = await showMonthPicker(
  //     context: context,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2045),
  //     initialDate: _focusedDay,
  //     selectedMonthBackgroundColor: ColorsUtil.mainButton,
  //     selectedMonthTextColor: Colors.white,
  //     dismissible: true,
  //   );
  //   if (selectedDate != null) {
  //     setState(() {
  //       _focusedDay = selectedDate;
  //     });
  //     if (widget.onSelectedDate != null) {
  //       widget.onSelectedDate!(_focusedDay);
  //     }
  //   }
  // }
}

class CalendarMarkerAdapter {
  CalendarMarkerAdapter({
    this.date,
    this.isHoliday = false,
    required this.widget,
  });
  final DateTime? date;
  final bool isHoliday;
  final Widget widget;
}

class CalendarDay extends StatelessWidget {
  const CalendarDay({
    super.key,
    required this.date,
    this.marker,
    this.color,
    this.isSelected = false,
  });

  final DateTime date;
  final CalendarMarkerAdapter? marker;
  final Color? color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: color,
        // border: Border.all(
        //   width: 0.5,
        //   color: Colors.grey[300]!,
        // ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        alignment: Alignment.topCenter,
        child: Text(
          '${date.day}',
          style: const TextStyle().copyWith(
            fontSize: 12.0,
            color: _dateFontColor,
          ),
        ),
      ),
    );
  }

  Color get _dateFontColor {
    if (isSelected) {
      return Colors.white;
    }

    if (marker?.isHoliday == true) {
      return Colors.red;
    }

    return Colors.grey.shade900;
  }
}