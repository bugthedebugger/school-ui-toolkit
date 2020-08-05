import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class NepaliCalendarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(DateTime.sunday);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Nepali Calendar'),
        centerTitle: true,
      ),
      body: NepaliCalendar(
        startExpanded: true,
        onDateSelected: (date) {
          print('Selected date: $date');
        },
        onNextMonth: (date) {
          print('Next month: $date');
        },
        onPreviousMonth: (date) {
          print('Previous month: $date');
        },
        calendarEvents: [
          NepaliCalendarEvent.fromDateTime(
            dateTime: NepaliDateTime.now(),
            color: SchoolToolkitColors.red,
          ),
        ],
        recurringEventsByDay: [
          NepaliCalendarEvent.fromDateTime(
            dateTime: NepaliDateTime(2020, 7, 1),
            color: SchoolToolkitColors.green,
          ),
        ],
        recurringEventsByWeekday: [
          NepaliCalendarEvent.fromWeekDay(
            weekDay: 1,
            color: SchoolToolkitColors.brown,
          ),
        ],
      ),
    );
  }
}
