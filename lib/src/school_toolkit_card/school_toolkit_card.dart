import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class SchoolToolkitCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color activeColor;
  final bool active;
  final Duration animationDuration;
  final Alignment alignment;
  final double width;
  final double height;
  final bool showShadow;
  final EdgeInsets margin;

  const SchoolToolkitCard({
    Key key,
    this.child,
    this.backgroundColor = SchoolToolkitColors.blueGrey,
    this.activeColor = SchoolToolkitColors.blue,
    this.active = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.alignment = Alignment.center,
    this.width,
    this.height,
    this.showShadow = false,
    this.margin,
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

    return AnimatedContainer(
      duration: animationDuration,
      padding: EdgeInsets.all(
        ScreenUtil().setWidth(15),
      ),
      margin: margin,
      curve: Curves.ease,
      width: width,
      height: height,
      alignment: alignment,
      decoration: BoxDecoration(
        color: active ? activeColor : backgroundColor,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(10),
        ),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  blurRadius: ScreenUtil().setHeight(15),
                  color: SchoolToolkitColors.blackShadow,
                  offset: Offset(
                    0,
                    ScreenUtil().setHeight(15),
                  ),
                  spreadRadius: ScreenUtil().setHeight(13),
                ),
              ]
            : [],
      ),
      child: child,
    );
  }
}
