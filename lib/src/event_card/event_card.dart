import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/school_toolkit_card/school_toolkit_card.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class EventCard extends StatelessWidget {
  final double width;
  final double height;
  final String time;
  final String event;
  final Color primaryColor;
  final Color secondaryColor;

  const EventCard({
    Key key,
    this.width,
    this.height,
    this.time,
    this.event,
    this.primaryColor = SchoolToolkitColors.brown,
    this.secondaryColor = SchoolToolkitColors.lightBrown,
  }) : super(key: key);

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

    return SchoolToolkitCard(
      width: width ?? ScreenUtil().setWidth(374),
      height: height ?? ScreenUtil().setHeight(80),
      backgroundColor: secondaryColor,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$time',
            style: TextStyle(
              color: SchoolToolkitColors.darkBlack,
              fontWeight: FontSize.semiBold,
              fontSize: FontSize.fontSize14,
            ),
          ),
          Text(
            '$event',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontSize.semiBold,
              fontSize: FontSize.fontSize16,
            ),
          ),
        ],
      ),
    );
  }
}
