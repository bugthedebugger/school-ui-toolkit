import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class NepaliCalendarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
