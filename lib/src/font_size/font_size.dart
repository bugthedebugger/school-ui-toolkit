import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontSize {
  static const double _fontSize10 = 10.0;
  static const double _fontSize12 = 12.0;
  static const double _fontSize14 = 14.0;
  static const double _fontSize15 = 15.0;
  static const double _fontSize16 = 16.0;
  static const double _fontSize18 = 18.0;
  static const double _fontSize20 = 20.0;
  static const double _fontSize22 = 22.0;
  static const double _fontSize24 = 24.0;
  static const double _fontSize26 = 26.0;
  static const double _fontSize28 = 28.0;
  static const double _fontSize30 = 30.0;
  static const double _fontSize32 = 32.0;
  static const double _fontSize34 = 34.0;
  static const double _fontSize36 = 36.0;

  static double get fontSize10 => ScreenUtil().setSp(_fontSize10);
  static double get fontSize12 => ScreenUtil().setSp(_fontSize12);
  static double get fontSize14 => ScreenUtil().setSp(_fontSize14);
  static double get fontSize15 => ScreenUtil().setSp(_fontSize15);
  static double get fontSize16 => ScreenUtil().setSp(_fontSize16);
  static double get fontSize18 => ScreenUtil().setSp(_fontSize18);
  static double get fontSize20 => ScreenUtil().setSp(_fontSize20);
  static double get fontSize22 => ScreenUtil().setSp(_fontSize22);
  static double get fontSize24 => ScreenUtil().setSp(_fontSize24);
  static double get fontSize26 => ScreenUtil().setSp(_fontSize26);
  static double get fontSize28 => ScreenUtil().setSp(_fontSize28);
  static double get fontSize30 => ScreenUtil().setSp(_fontSize30);
  static double get fontSize32 => ScreenUtil().setSp(_fontSize32);
  static double get fontSize34 => ScreenUtil().setSp(_fontSize34);
  static double get fontSize36 => ScreenUtil().setSp(_fontSize36);

  static FontWeight get thin => FontWeight.w100;
  static FontWeight get extraLight => FontWeight.w200;
  static FontWeight get light => FontWeight.w300;
  static FontWeight get regular => FontWeight.w400;
  static FontWeight get medium => FontWeight.w500;
  static FontWeight get semiBold => FontWeight.w600;
  static FontWeight get bold => FontWeight.w700;
  static FontWeight get extraBold => FontWeight.w800;
  static FontWeight get black => FontWeight.w900;
}
