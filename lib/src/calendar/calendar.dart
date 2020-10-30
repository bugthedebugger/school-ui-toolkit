import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:school_ui_toolkit/src/calendar/calendar_date_element.dart';
import 'package:school_ui_toolkit/src/calendar/calendar_event.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/utils/calendar_utils.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class Calendar extends StatefulWidget {
  final bool startExpanded;
  final Function(DateTime) onDateSelected;
  final Function(DateTime) onPreviousMonth;
  final Function(DateTime) onNextMonth;
  final List<CalendarEvent> recurringEventsByWeekday;
  final List<CalendarEvent> calendarEvents;
  final List<CalendarEvent> recurringEventsByDay;

  const Calendar({
    Key key,
    this.startExpanded = false,
    this.onDateSelected,
    this.onPreviousMonth,
    this.onNextMonth,
    this.calendarEvents,
    this.recurringEventsByWeekday,
    this.recurringEventsByDay,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>
    with SingleTickerProviderStateMixin {
  DateTime _selectedDate = DateTime.now();
  List<DateTime> _weekDayDateTimeList;
  bool _expanded = false;
  DateTime _startOfMonth;
  List<DateTime> _monthDateTimeList;
  List<List<DateTime>> _calendarData;

  @override
  void initState() {
    _expanded = widget.startExpanded;
    _initCalendar();
    super.initState();
  }

  void _initCalendar() {
    _weekDayDateTimeList = List<DateTime>();
    _monthDateTimeList = List<DateTime>();
    _calendarData = List<List<DateTime>>();

    if (_selectedDate.day == 1) {
      _startOfMonth = _selectedDate;
    } else {
      _startOfMonth = _selectedDate.subtract(
        Duration(days: _selectedDate.day - 1),
      );
    }

    if (_startOfMonth.day != DateTime.sunday) {
      _startOfMonth = _startOfMonth.subtract(
        Duration(days: _startOfMonth.weekday),
      );
    }

    for (int i = 0;; i = i + 7) {
      DateTime date = _startOfMonth.add(Duration(days: i));
      List<DateTime> tempDateList = List<DateTime>();

      for (int i = 0; i < 7; i++) {
        tempDateList.add(date.add(Duration(days: i)));
      }
      _calendarData.add(tempDateList);
      if (_startOfMonth.add(Duration(days: i + 7)).month !=
          _selectedDate.month) {
        break;
      }
    }

    DateTime weekDayCalendar;
    if (_selectedDate.weekday == DateTime.sunday) {
      weekDayCalendar = _selectedDate;
    } else {
      weekDayCalendar = _selectedDate.subtract(Duration(
        days: _selectedDate.weekday,
      ));
    }
    for (int i = 0; i < 7; i++) {
      _weekDayDateTimeList?.add(weekDayCalendar.add(Duration(days: i)));
    }

    for (int i = 0;; i++) {
      DateTime date = _startOfMonth.add(Duration(days: i));
      if (date.month != _selectedDate.month) {
        break;
      }
      _monthDateTimeList.add(date);
    }
  }

  void _nextMonth() {
    if (_selectedDate.month == DateTime.december) {
      _selectedDate = DateTime(
        _selectedDate.year + 1,
        1,
        _selectedDate.day,
      );
    } else {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month + 1,
        _selectedDate.day,
      );
    }
    setState(() {
      _initCalendar();
    });
  }

  void _previousMonth() {
    if (_selectedDate.month == DateTime.january) {
      _selectedDate = DateTime(
        _selectedDate.year - 1,
        12,
        _selectedDate.day,
      );
    } else {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month - 1,
        _selectedDate.day,
      );
    }
    setState(() {
      _initCalendar();
    });
  }

  void _selectDate(DateTime date) {
    _selectedDate = date;
    setState(() {
      _initCalendar();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ScreenUtil() == null) {
      ScreenUtil.init(
        context,
        designSize: Size(
          ScreenSize.width,
          ScreenSize.height,
        ),
        allowFontScaling: true,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(414),
          padding: EdgeInsets.all(
            ScreenUtil().setWidth(25),
          ),
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: ScreenUtil().setHeight(15),
                color: SchoolToolkitColors.blackShadow,
                offset: Offset(
                  0,
                  ScreenUtil().setHeight(15),
                ),
                spreadRadius: ScreenUtil().setHeight(13),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      _previousMonth();
                      if (widget.onPreviousMonth != null) {
                        widget.onPreviousMonth(_selectedDate);
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.chevronLeft,
                      size: FontSize.fontSize20,
                      color: SchoolToolkitColors.black,
                    ),
                  ),
                  Text(
                    '${DateFormat('MMMM, yyyy').format(_selectedDate)}',
                    style: TextStyle(
                      color: SchoolToolkitColors.darkBlack,
                      fontWeight: FontSize.semiBold,
                      fontSize: FontSize.fontSize20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _nextMonth();
                      if (widget.onNextMonth != null) {
                        widget.onNextMonth(_selectedDate);
                      }
                    },
                    icon: Icon(
                      FontAwesomeIcons.chevronRight,
                      size: FontSize.fontSize20,
                      color: SchoolToolkitColors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(22),
              ),
              AnimatedSize(
                vsync: this,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  child: _expanded
                      ? Container(
                          child: Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              TableRow(
                                children: _weekDayDateTimeList.map((day) {
                                  String dayInital = DateFormat('E')
                                      .format(day)
                                      .substring(0, 1);
                                  return Center(
                                    child: Text(
                                      '$dayInital',
                                      style: TextStyle(
                                        color: day.weekday ==
                                                DateTime.now().weekday
                                            ? SchoolToolkitColors.blue
                                            : SchoolToolkitColors.lightGrey,
                                        fontWeight: FontSize.semiBold,
                                        fontSize: FontSize.fontSize20,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              for (List<DateTime> dateList
                                  in _calendarData) ...[
                                TableRow(
                                  children: [
                                    for (int i = 0; i < 7; i++)
                                      Container(
                                        height: ScreenUtil().setHeight(5),
                                      ),
                                  ],
                                ),
                                TableRow(
                                  children: dateList.map((date) {
                                    return Column(
                                      children: <Widget>[
                                        CalendarDateElement(
                                          date: date.day,
                                          today:
                                              date.day == DateTime.now().day &&
                                                  date.month ==
                                                      DateTime.now().month,
                                          fade:
                                              date.month != _selectedDate.month,
                                          selected: date.day ==
                                                  _selectedDate.day &&
                                              date.month == _selectedDate.month,
                                          onTap: () {
                                            _selectDate(date);
                                            if (widget.onDateSelected != null) {
                                              widget.onDateSelected(date);
                                            }
                                          },
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5.0),
                                        ),
                                        Container(
                                          width: ScreenUtil().setWidth(6),
                                          height: ScreenUtil().setWidth(6),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: CalendarUtils
                                                .getCalendarEventColor(
                                              date,
                                              widget.recurringEventsByWeekday,
                                              widget.recurringEventsByDay,
                                              widget.calendarEvents,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ],
                            ],
                          ),
                        )
                      : Table(
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: [
                            TableRow(
                              children: _weekDayDateTimeList.map((day) {
                                String dayInitial =
                                    DateFormat('E').format(day).substring(0, 1);
                                return Center(
                                  child: Text(
                                    '$dayInitial',
                                    style: TextStyle(
                                      color:
                                          day.weekday == DateTime.now().weekday
                                              ? SchoolToolkitColors.blue
                                              : SchoolToolkitColors.lightGrey,
                                      fontWeight: FontSize.semiBold,
                                      fontSize: FontSize.fontSize20,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            TableRow(
                              children: [
                                for (int i = 0; i < 7; i++)
                                  Container(
                                    height: ScreenUtil().setHeight(5),
                                  ),
                              ],
                            ),
                            TableRow(
                              children: _weekDayDateTimeList.map((date) {
                                return Column(
                                  children: <Widget>[
                                    CalendarDateElement(
                                      date: date.day,
                                      today: date.day == DateTime.now().day &&
                                          date.month == DateTime.now().month,
                                      fade: date.month != _selectedDate.month,
                                      selected: date.day == _selectedDate.day &&
                                          date.month == _selectedDate.month,
                                      onTap: () {
                                        _selectDate(date);
                                        if (widget.onDateSelected != null) {
                                          widget.onDateSelected(date);
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setHeight(5.0),
                                    ),
                                    Container(
                                      width: ScreenUtil().setWidth(6),
                                      height: ScreenUtil().setWidth(6),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            CalendarUtils.getCalendarEventColor(
                                          date,
                                          widget.recurringEventsByWeekday,
                                          widget.recurringEventsByDay,
                                          widget.calendarEvents,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
            child: Container(
              width: ScreenUtil().setWidth(66),
              height: ScreenUtil().setHeight(30),
              color: SchoolToolkitColors.lighterBlue,
              child: Icon(
                _expanded
                    ? FontAwesomeIcons.chevronUp
                    : FontAwesomeIcons.chevronDown,
                color: SchoolToolkitColors.blue,
                size: ScreenUtil().setWidth(18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
