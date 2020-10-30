import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class InformationTileWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final IconData icon;
  final bool biggerTitle;
  final bool rounded;
  final Color iconColor;
  final Color iconBackgroundColor;
  final Function onTap;
  final Color titleColor;
  final Color subTitleColor;

  const InformationTileWidget({
    Key key,
    this.title,
    this.subTitle,
    this.padding,
    this.margin,
    this.color = Colors.transparent,
    @required this.icon,
    this.biggerTitle = false,
    this.rounded = true,
    this.iconColor = SchoolToolkitColors.grey,
    this.iconBackgroundColor = Colors.white,
    this.onTap,
    this.titleColor = SchoolToolkitColors.darkBlack,
    this.subTitleColor = SchoolToolkitColors.grey,
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

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(5.0),
        ),
        color: color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(42),
                height: ScreenUtil().setWidth(42),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: rounded ? BoxShape.circle : BoxShape.rectangle,
                  color: iconBackgroundColor,
                  borderRadius: !rounded
                      ? BorderRadius.circular(
                          ScreenUtil().setWidth(5),
                        )
                      : null,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: FontSize.fontSize20,
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(18),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (title != null)
                    Container(
                      width: ScreenUtil().setWidth(250),
                      child: Text(
                        '${title ?? 'Untitled'}',
                        style: TextStyle(
                          color: biggerTitle ? titleColor : subTitleColor,
                          fontSize: biggerTitle
                              ? FontSize.fontSize16
                              : FontSize.fontSize14,
                          fontWeight:
                              biggerTitle ? FontSize.bold : FontSize.regular,
                        ),
                      ),
                    ),
                  if (subTitle != null)
                    Container(
                      width: ScreenUtil().setWidth(250),
                      child: Text(
                        '${subTitle ?? 'Untitled'}',
                        style: TextStyle(
                          color: !biggerTitle ? titleColor : subTitleColor,
                          fontSize: !biggerTitle
                              ? FontSize.fontSize16
                              : FontSize.fontSize14,
                          fontWeight:
                              !biggerTitle ? FontSize.bold : FontSize.regular,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
