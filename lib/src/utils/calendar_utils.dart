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
}
