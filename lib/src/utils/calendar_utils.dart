import 'package:flutter/material.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:school_ui_toolkit/src/calendar/calendar_event.dart';
import 'package:school_ui_toolkit/src/nepali_calendar/nepali_calendar_event.dart';

class CalendarUtils {
  /// holday takes precedence over other colors
  static Color getNepaliCalendarEventColor(
    NepaliDateTime date,
    List<NepaliCalendarEvent> recurringEventsByWeekday,
    List<NepaliCalendarEvent> recurringEventsByDay,
    List<NepaliCalendarEvent> calendarEvents,
  ) {
    Color color = Colors.transparent;
    NepaliCalendarEvent holidayEvent;

    if (checkIfRecurringByWeekDayBS(date, recurringEventsByWeekday)) {
      recurringEventsByWeekday.forEach((element) {
        if (element.weekDay == date.weekday) {
          if (element.holiday) {
            holidayEvent = element;
            color = element.color;
          } else if (holidayEvent == null) {
            color = element.color;
          }
        }
      });
    }

    if (checkIfRecurringByDayBS(date, recurringEventsByDay)) {
      recurringEventsByDay.forEach((element) {
        if (element.dateTime.day == date.day) {
          if (element.holiday) {
            holidayEvent = element;
            color = element.color;
          } else if (holidayEvent == null) {
            color = element.color;
          }
        }
      });
    }

    if (checkIfCalendarEventBS(date, calendarEvents)) {
      calendarEvents.forEach((element) {
        if (element.dateTime.day == date.day &&
            element.dateTime.month == date.month &&
            element.dateTime.year == date.year) {
          if (element.holiday) {
            holidayEvent = element;
            color = element.color;
          } else if (holidayEvent == null) {
            color = element.color;
          }
        }
      });
    }

    return color;
  }

  /// holday takes precedence over other colors
  static Color getCalendarEventColor(
    DateTime date,
    List<CalendarEvent> recurringEventsByWeekday,
    List<CalendarEvent> recurringEventsByDay,
    List<CalendarEvent> calendarEvents,
  ) {
    Color color = Colors.transparent;
    CalendarEvent holidayEvent;

    if (checkIfRecurringByWeekDay(date, recurringEventsByWeekday)) {
      recurringEventsByWeekday.forEach((element) {
        if (element.weekDay == date.weekday) {
          if (element.holiday) {
            holidayEvent = element;
            color = element.color;
          } else if (holidayEvent == null) {
            color = element.color;
          }
        }
      });
    }

    if (checkIfRecurringByDay(date, recurringEventsByDay)) {
      recurringEventsByDay.forEach((element) {
        if (element.dateTime.day == date.day) {
          if (element.holiday) {
            holidayEvent = element;
            color = element.color;
          } else if (holidayEvent == null) {
            color = element.color;
          }
        }
      });
    }

    if (checkIfCalendarEvent(date, calendarEvents)) {
      calendarEvents.forEach((element) {
        if (element.dateTime.day == date.day &&
            element.dateTime.month == date.month &&
            element.dateTime.year == date.year) {
          if (element.holiday) {
            holidayEvent = element;
            color = element.color;
          } else if (holidayEvent == null) {
            color = element.color;
          }
        }
      });
    }

    return color;
  }

  static bool checkIfRecurringByDay(
      DateTime date, List<CalendarEvent> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => event.dateTime.day == date.day) !=
        -1;
  }

  static bool checkIfCalendarEvent(
      DateTime date, List<CalendarEvent> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => (event.dateTime.day == date.day &&
            event.dateTime.month == date.month &&
            event.dateTime.year == date.year)) !=
        -1;
  }

  static bool checkIfRecurringByWeekDay(
      DateTime date, List<CalendarEvent> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => event.weekDay == date.weekday) !=
        -1;
  }

  static bool checkIfRecurringByDayBS(
      NepaliDateTime date, List<NepaliCalendarEvent> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => event.dateTime.day == date.day) !=
        -1;
  }

  static bool checkIfCalendarEventBS(
      NepaliDateTime date, List<NepaliCalendarEvent> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => (event.dateTime.day == date.day &&
            event.dateTime.month == date.month &&
            event.dateTime.year == date.year)) !=
        -1;
  }

  static bool checkIfRecurringByWeekDayBS(
      NepaliDateTime date, List<NepaliCalendarEvent> eventList) {
    if (eventList == null) return false;
    return eventList?.indexWhere((event) => event.weekDay == date.weekday) !=
        -1;
  }
}
