import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class CalendarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School location widget'),
        centerTitle: true,
      ),
      body: Center(
        child: Calendar(
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
      ),
    );
  }
}
