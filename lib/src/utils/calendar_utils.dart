import 'package:nepali_date_picker/nepali_date_picker.dart';

class CalendarUtils {
  static bool checkIfRecurringByDay(DateTime date, List<DateTime> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => event.day == date.day) != -1;
  }

  static bool checkIfCalendarEvent(DateTime date, List<DateTime> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => (event.day == date.day &&
            event.month == date.month &&
            event.year == date.year)) !=
        -1;
  }

  static bool checkIfRecurringByWeekDay(DateTime date, List<int> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => event == date.weekday) != -1;
  }

  static bool checkIfRecurringByDayBS(
      NepaliDateTime date, List<NepaliDateTime> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => event.day == date.day) != -1;
  }

  static bool checkIfCalendarEventBS(
      NepaliDateTime date, List<NepaliDateTime> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => (event.day == date.day &&
            event.month == date.month &&
            event.year == date.year)) !=
        -1;
  }

  static bool checkIfRecurringByWeekDayBS(
      NepaliDateTime date, List<int> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => event == date.weekday) != -1;
  }
}
