import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class OverlappingButtonCard extends StatelessWidget {
  final Function onPressed;
  final String label;
  final Widget child;
  final EdgeInsets padding;
  final double height;
  final double width;

  const OverlappingButtonCard({
    Key key,
    this.onPressed,
    this.label,
    this.padding,
    this.height,
    this.width,
    this.child,
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

    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(20),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: ScreenUtil().setWidth(34),
                  color: SchoolToolkitColors.blackShadow,
                  offset: Offset(
                    0,
                    ScreenUtil().setHeight(1),
                  ),
                ),
              ]),
          child: child,
        ),
        Positioned(
          top: (height ?? 0) - ScreenUtil().setHeight(30),
          child: FlatButton(
            onPressed: onPressed,
            disabledColor: SchoolToolkitColors.lightBlack,
            disabledTextColor: Colors.white54,
            textColor: SchoolToolkitColors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(10),
              ),
            ),
            color: SchoolToolkitColors.yellow,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(18),
                horizontal: ScreenUtil().setWidth(20),
              ),
              child: Text(
                '$label',
                style: TextStyle(
                  fontSize: FontSize.fontSize16,
                  fontWeight: FontSize.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
