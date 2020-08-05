import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class NepaliCalendarEvent {
  NepaliDateTime dateTime;
  int weekDay;
  final Color color;
  final bool holiday;

  NepaliCalendarEvent.fromDateTime({
    @required this.dateTime,
    this.color = SchoolToolkitColors.blue,
    this.holiday = false,
  });

  NepaliCalendarEvent.fromWeekDay({
    @required this.weekDay,
    this.color = SchoolToolkitColors.blue,
    this.holiday = false,
  });
}
