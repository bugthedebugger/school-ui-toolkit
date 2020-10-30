import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class HighlightedIcon extends StatelessWidget {
  final IconData icon;
  final bool busy;

  const HighlightedIcon({
    Key key,
    @required this.icon,
    this.busy = false,
  })  : assert(icon != null),
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

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(124),
          height: ScreenUtil().setWidth(124),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: SchoolToolkitColors.blueGrey,
          ),
        ),
        Container(
          width: ScreenUtil().setWidth(94),
          height: ScreenUtil().setHeight(94),
          constraints: BoxConstraints(
            maxHeight: ScreenUtil().setHeight(94),
            maxWidth: ScreenUtil().setHeight(94),
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: ScreenUtil().setWidth(21),
                color: SchoolToolkitColors.greyShadow,
                offset: Offset(
                  0,
                  ScreenUtil().setHeight(3),
                ),
              ),
            ],
          ),
          child: busy
              ? Center(
                  child: Theme(
                    data: ThemeData(
                      primaryColor: SchoolToolkitColors.blue,
                      accentColor: SchoolToolkitColors.blue,
                    ),
                    child: Container(
                      height: ScreenUtil().setWidth(32),
                      width: ScreenUtil().setWidth(32),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : Icon(
                  icon,
                  color: SchoolToolkitColors.blue,
                  size: FontSize.fontSize30,
                ),
        ),
      ],
    );
  }
}
