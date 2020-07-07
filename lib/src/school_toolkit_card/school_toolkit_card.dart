import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';

class SchoolToolkitCard extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color activeColor;
  final bool active;
  final Duration animationDuration;
  final Alignment alignment;
  final double width;
  final double height;

  const SchoolToolkitCard({
    Key key,
    this.child,
    this.backgroundColor = SchoolToolkitColors.blue_grey,
    this.activeColor = SchoolToolkitColors.blue,
    this.active = false,
    this.animationDuration = const Duration(milliseconds: 300),
    this.alignment = Alignment.center,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      padding: EdgeInsets.all(
        ScreenUtil().setWidth(15),
      ),
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setHeight(height),
      alignment: alignment,
      decoration: BoxDecoration(
        color: active ? activeColor : backgroundColor,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(10),
        ),
      ),
      child: child,
    );
  }
}
