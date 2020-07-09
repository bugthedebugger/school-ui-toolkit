import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/deadline_card/deadline_card.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';

class AssignmentCard extends StatelessWidget {
  final String question;
  final String subject;
  final String teacher;
  final DateTime deadline;
  final Color deadlineBackgroundColor;
  final Color deadlineTextColor;

  const AssignmentCard({
    Key key,
    this.question,
    this.subject,
    this.teacher,
    this.deadline,
    this.deadlineBackgroundColor,
    this.deadlineTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(374),
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(15),
        horizontal: ScreenUtil().setWidth(15),
      ),
      constraints: BoxConstraints(
        minHeight: ScreenUtil().setHeight(140),
      ),
      decoration: BoxDecoration(
        color: SchoolToolkitColors.blue_grey,
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.questionCircle,
                color: SchoolToolkitColors.medium_grey,
                size: FontSize.fontSize16,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(5),
              ),
              Container(
                width: ScreenUtil().setWidth(320),
                child: Text(
                  '$question',
                  style: TextStyle(
                    color: SchoolToolkitColors.dark_black,
                    fontSize: FontSize.fontSize16,
                    fontWeight: FontSize.semiBold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.book,
                color: SchoolToolkitColors.medium_grey,
                size: FontSize.fontSize16,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(7),
              ),
              Text(
                '$subject',
                style: TextStyle(
                  color: SchoolToolkitColors.medium_grey,
                  fontSize: FontSize.fontSize14,
                  fontWeight: FontSize.medium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.userGraduate,
                color: SchoolToolkitColors.medium_grey,
                size: FontSize.fontSize16,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(7),
              ),
              Text(
                '$teacher',
                style: TextStyle(
                  color: SchoolToolkitColors.medium_grey,
                  fontSize: FontSize.fontSize14,
                  fontWeight: FontSize.medium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          if (deadline != null)
            DeadlineCard(
              deadline: deadline,
              primaryColor: deadlineTextColor,
              secondaryColor: deadlineBackgroundColor,
            ),
        ],
      ),
    );
  }
}
