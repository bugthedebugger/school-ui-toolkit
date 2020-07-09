import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';

class InformationTileWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final IconData icon;

  const InformationTileWidget({
    Key key,
    this.title,
    this.subTitle,
    this.padding,
    this.margin,
    this.color = Colors.transparent,
    @required this.icon,
  })  : assert(icon != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(42),
                height: ScreenUtil().setWidth(42),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  icon,
                  color: SchoolToolkitColors.grey,
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
                  Container(
                    width: ScreenUtil().setWidth(250),
                    child: Text(
                      '${title ?? 'Unknown'}',
                      style: TextStyle(
                        color: SchoolToolkitColors.grey,
                        fontSize: FontSize.fontSize14,
                        fontWeight: FontSize.regular,
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(250),
                    child: Text(
                      '${subTitle ?? 'Untitled'}',
                      style: TextStyle(
                        color: SchoolToolkitColors.dark_black,
                        fontSize: FontSize.fontSize16,
                        fontWeight: FontSize.bold,
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
