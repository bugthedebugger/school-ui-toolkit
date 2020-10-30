import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class DeadlineCard extends StatelessWidget {
  final DateTime deadline;
  final Color primaryColor;
  final Color secondaryColor;

  const DeadlineCard({
    Key key,
    @required this.deadline,
    this.primaryColor = Colors.white,
    this.secondaryColor = SchoolToolkitColors.tealGreen,
  })  : assert(deadline != null),
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

    return Container(
      height: ScreenUtil().setHeight(40),
      constraints: BoxConstraints(
        minWidth: ScreenUtil().setWidth(200),
        maxWidth: ScreenUtil().setWidth(280),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(10),
        vertical: ScreenUtil().setWidth(5),
      ),
      decoration: BoxDecoration(
        color: secondaryColor ?? SchoolToolkitColors.tealGreen,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(5.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(6),
            height: ScreenUtil().setHeight(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(5.0),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                'Deadline: ${DateFormat('h:mm a | dd MMMM, yyyy').format(deadline)}'
                    .toUpperCase(),
                style: TextStyle(
                  color: primaryColor ?? Colors.white,
                  fontSize: FontSize.fontSize14,
                  fontWeight: FontSize.semiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
