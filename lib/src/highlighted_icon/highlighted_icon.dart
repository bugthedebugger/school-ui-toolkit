import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';

class HighlightedIcon extends StatelessWidget {
  final IconData icon;

  const HighlightedIcon({
    Key key,
    @required this.icon,
  })  : assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: ScreenUtil().setWidth(144),
          height: ScreenUtil().setWidth(144),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: SchoolToolkitColors.blue_grey,
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
                color: SchoolToolkitColors.grey_shadow,
                offset: Offset(
                  0,
                  ScreenUtil().setHeight(3),
                ),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: SchoolToolkitColors.blue,
            size: FontSize.fontSize30,
          ),
        ),
      ],
    );
  }
}
