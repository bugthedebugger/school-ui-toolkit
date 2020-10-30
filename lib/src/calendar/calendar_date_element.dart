import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class CalendarDateElement extends StatelessWidget {
  final int date;
  final bool today;
  final bool fade;
  final Function onTap;
  final bool selected;

  const CalendarDateElement({
    Key key,
    @required this.date,
    this.today = false,
    this.fade = false,
    this.onTap,
    this.selected = false,
  })  : assert(date != null),
        super(key: key);

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

    if (today) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: ScreenUtil().setWidth(40),
          height: ScreenUtil().setWidth(40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: SchoolToolkitColors.lighterBlue,
            border: Border.all(
              color: today && selected
                  ? SchoolToolkitColors.blue
                  : Colors.transparent,
              width: ScreenUtil().setWidth(2.0),
            ),
          ),
          child: Text(
            '$date',
            style: TextStyle(
              color: SchoolToolkitColors.blue,
              fontSize: FontSize.fontSize16,
              fontWeight: FontSize.semiBold,
            ),
          ),
        ),
      );
    } else if (selected) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: ScreenUtil().setWidth(40),
          height: ScreenUtil().setWidth(40),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: SchoolToolkitColors.lighter_blue,
            border: Border.all(
              color: SchoolToolkitColors.blue,
              width: ScreenUtil().setWidth(2.0),
            ),
          ),
          child: Text(
            '$date',
            style: TextStyle(
              color: SchoolToolkitColors.blue,
              fontSize: FontSize.fontSize16,
              fontWeight: FontSize.semiBold,
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: ScreenUtil().setWidth(40),
          height: ScreenUtil().setWidth(40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
          ),
          child: Text(
            '$date',
            style: TextStyle(
              color: fade
                  ? SchoolToolkitColors.lightGrey
                  : SchoolToolkitColors.darkBlack,
              fontSize: FontSize.fontSize16,
              fontWeight: FontSize.semiBold,
            ),
          ),
        ),
      );
    }
  }
}
