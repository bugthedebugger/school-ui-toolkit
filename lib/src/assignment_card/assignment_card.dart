import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:school_ui_toolkit/src/assignment_card/assignment_card_file_element.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/deadline_card/deadline_card.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class AssignmentCard extends StatelessWidget {
  final String question;
  final String subject;
  final String teacher;
  final DateTime deadline;
  final Color deadlineBackgroundColor;
  final Color deadlineTextColor;
  final Function onUploadHandler;
  final List<FileWrapper> fileList;

  const AssignmentCard({
    Key key,
    this.question,
    this.subject,
    this.teacher,
    this.deadline,
    this.deadlineBackgroundColor,
    this.deadlineTextColor,
    this.onUploadHandler,
    this.fileList,
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
        color: SchoolToolkitColors.blueGrey,
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
                color: SchoolToolkitColors.mediumGrey,
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
                    color: SchoolToolkitColors.darkBlack,
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
                color: SchoolToolkitColors.mediumGrey,
                size: FontSize.fontSize16,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(7),
              ),
              Text(
                '$subject',
                style: TextStyle(
                  color: SchoolToolkitColors.mediumGrey,
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
                color: SchoolToolkitColors.mediumGrey,
                size: FontSize.fontSize16,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(7),
              ),
              Text(
                '$teacher',
                style: TextStyle(
                  color: SchoolToolkitColors.mediumGrey,
                  fontSize: FontSize.fontSize14,
                  fontWeight: FontSize.medium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (deadline != null)
                DeadlineCard(
                  deadline: deadline,
                  primaryColor: deadlineTextColor,
                  secondaryColor: deadlineBackgroundColor,
                ),
              Expanded(
                child: Container(),
              ),
              if (onUploadHandler != null)
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: ScreenUtil().setWidth(36),
                    maxWidth: ScreenUtil().setWidth(36),
                  ),
                  child: FlatButton(
                    onPressed: onUploadHandler,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setWidth(10),
                      ),
                      side: BorderSide(
                        color: SchoolToolkitColors.blue,
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                    splashColor: SchoolToolkitColors.lightBlue,
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(5.0),
                    ),
                    child: Icon(
                      Icons.file_upload,
                      size: FontSize.fontSize18,
                      color: SchoolToolkitColors.blue,
                    ),
                  ),
                ),
            ],
          ),
          if (fileList != null && ((fileList?.length ?? 0) > 0)) ...[
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            ...fileList?.map((e) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: ScreenUtil().setHeight(10),
                ),
                child: AssignmentCardFileElement(fileWrapper: e),
              );
            })?.toList(),
          ]
        ],
      ),
    );
  }
}
