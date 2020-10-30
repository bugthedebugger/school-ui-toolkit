import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/label_card/label_card.dart';
import 'package:school_ui_toolkit/src/school_toolkit_card/school_toolkit_card.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class NoticeCard extends StatelessWidget {
  final String title;
  final String subTitile;
  final Function onTap;
  final String date;

  const NoticeCard({
    Key key,
    this.title,
    this.subTitile,
    this.onTap,
    this.date,
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

    return SchoolToolkitCard(
      active: true,
      height: ScreenUtil().setHeight(275),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(48),
            width: ScreenUtil().setWidth(48),
            decoration: BoxDecoration(
              color: SchoolToolkitColors.darkYellow,
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(10),
              ),
            ),
            child: Icon(
              FontAwesomeIcons.exclamationTriangle,
              color: Colors.white,
              size: FontSize.fontSize20,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Text(
            '$title',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontSize.semiBold,
              letterSpacing: 1.0,
              fontSize: FontSize.fontSize16,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Text(
            '$subTitile',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontSize.regular,
              fontSize: FontSize.fontSize16,
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              LabelCard(
                label: '$date',
              ),
              Expanded(
                child: Container(),
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  'READ MORE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontSize.bold,
                    fontSize: FontSize.fontSize16,
                  ),
                ),
              ),
              IconButton(
                onPressed: onTap,
                icon: Icon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.white,
                  size: FontSize.fontSize20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
