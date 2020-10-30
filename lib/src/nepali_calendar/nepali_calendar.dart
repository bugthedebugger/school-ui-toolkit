import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:school_ui_toolkit/src/calendar/calendar_date_element.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/nepali_calendar/nepali_calendar_event.dart';
import 'package:school_ui_toolkit/src/utils/calendar_utils.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class NepaliCalendar extends StatefulWidget {
  final bool startExpanded;
  final Function(NepaliDateTime) onDateSelected;
  final Function(NepaliDateTime) onPreviousMonth;
  final Function(NepaliDateTime) onNextMonth;
  final List<NepaliCalendarEvent> recurringEventsByWeekday;
  final List<NepaliCalendarEvent> calendarEvents;
  final List<NepaliCalendarEvent> recurringEventsByDay;

  const NepaliCalendar({
    Key key,
    this.startExpanded = false,
    this.onDateSelected,
    this.onPreviousMonth,
    this.onNextMonth,
    this.recurringEventsByWeekday,
    this.calendarEvents,
    this.recurringEventsByDay,
  }) : super(key: key);

  @override
  _NepaliCalendarState createState() => _NepaliCalendarState();
}

class _NepaliCalendarState extends State<NepaliCalendar>
    with SingleTickerProviderStateMixin {
  NepaliDateTime _selectedDate = NepaliDateTime.now();
  List<NepaliDateTime> _weekDayDateTimeList;
  bool _expanded = false;
  NepaliDateTime _startOfMonth;
  List<NepaliDateTime> _monthDateTimeList;
  List<List<NepaliDateTime>> _calendarData;

  @override
  void initState() {
    _expanded = widget.startExpanded;
    _initCalendar();
    super.initState();
  }

  void _initCalendar() {
    _weekDayDateTimeList = List<NepaliDateTime>();
    _monthDateTimeList = List<NepaliDateTime>();
    _calendarData = List<List<NepaliDateTime>>();

    if (_selectedDate.day == 1) {
      _startOfMonth = _selectedDate;
    } else {
      _startOfMonth = _selectedDate.subtract(
        Duration(days: _selectedDate.day - 1),
      );
    }

    if (_startOfMonth.weekday != 1) {
      _startOfMonth = _startOfMonth.subtract(
        Duration(days: _startOfMonth.weekday),
      );
    }

    for (int i = 0;; i = i + 7) {
      NepaliDateTime date = _startOfMonth.add(Duration(days: i));
      List<NepaliDateTime> tempDateList = List<NepaliDateTime>();

      for (int i = 0; i < 7; i++) {
        tempDateList.add(date.add(Duration(days: i + 1)));
      }
      _calendarData.add(tempDateList);
      if (_startOfMonth.add(Duration(days: i + 7)).month !=
          _selectedDate.month) {
        break;
      }
    }

    NepaliDateTime weekDayCalendar;
    if (_selectedDate.weekday == 1) {
      weekDayCalendar = _selectedDate;
    } else {
      weekDayCalendar = _selectedDate.subtract(Duration(
        days: _selectedDate.weekday - 1,
      ));
    }
    for (int i = 0; i < 7; i++) {
      _weekDayDateTimeList?.add(weekDayCalendar.add(Duration(days: i)));
    }

    for (int i = 0;; i++) {
      NepaliDateTime date = _startOfMonth.add(Duration(days: i));
      if (date.month != _selectedDate.month) {
        break;
      }
      _monthDateTimeList.add(date);
    }
  }

  void _nextMonth() {
    if (_selectedDate.month == 12) {
      _selectedDate = NepaliDateTime(
        _selectedDate.year + 1,
        1,
        _selectedDate.day,
      );
    } else {
      _selectedDate = NepaliDateTime(
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
    if (_selectedDate.month == 1) {
      _selectedDate = NepaliDateTime(
        _selectedDate.year - 1,
        12,
        _selectedDate.day,
      );
    } else {
      _selectedDate = NepaliDateTime(
        _selectedDate.year,
        _selectedDate.month - 1,
        _selectedDate.day,
      );
    }
    setState(() {
      _initCalendar();
    });
  }

  void _selectDate(NepaliDateTime date) {
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
                    '${NepaliDateFormat('MMMM, yyyy').format(_selectedDate)}',
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
                                  String dayInital = NepaliDateFormat('E')
                                      .format(day)
                                      .substring(0, 1);
                                  return Center(
                                    child: Text(
                                      '$dayInital',
                                      style: TextStyle(
                                        color: day.weekday ==
                                                NepaliDateTime.now().weekday
                                            ? SchoolToolkitColors.blue
                                            : SchoolToolkitColors.lightGrey,
                                        fontWeight: FontSize.semiBold,
                                        fontSize: FontSize.fontSize20,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              for (List<NepaliDateTime> dateList
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
                                          today: date.day ==
                                                  NepaliDateTime.now().day &&
                                              date.month ==
                                                  NepaliDateTime.now().month,
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
                                                .getNepaliCalendarEventColor(
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
                                String dayInitial = NepaliDateFormat('E')
                                    .format(day)
                                    .substring(0, 1);
                                return Center(
                                  child: Text(
                                    '$dayInitial',
                                    style: TextStyle(
                                      color: day.weekday ==
                                              NepaliDateTime.now().weekday
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
                                      today: date.day ==
                                              NepaliDateTime.now().day &&
                                          date.month ==
                                              NepaliDateTime.now().month,
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
                                        color: CalendarUtils
                                            .getNepaliCalendarEventColor(
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
