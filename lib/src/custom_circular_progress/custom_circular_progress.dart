import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class CustomCircularProgress extends StatelessWidget {
  final Color color;

  const CustomCircularProgress({
    Key key,
    this.color = SchoolToolkitColors.blue,
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

    return Theme(
      data: ThemeData(
        accentColor: color,
      ),
      child: Container(
        height: ScreenUtil().setWidth(15),
        width: ScreenUtil().setWidth(15),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
