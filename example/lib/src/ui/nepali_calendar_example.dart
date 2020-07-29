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
          NepaliDateTime.now(),
        ],
        recurringEventsByDay: [
          NepaliDateTime(2020, 7, 1),
        ],
        recurringEventsByWeekday: [
          1,
        ],
      ),
    );
  }
}
