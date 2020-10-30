import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';

class AssignmentCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment card'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
                child: AssignmentCard(
                  deadline: DateTime.now(),
                  question:
                      'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
                  subject: 'Mathematics',
                  teacher: 'Dr. Stone',
                  onUploadHandler: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
                child: AssignmentCard(
                  deadline: DateTime.now(),
                  question:
                      'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
                  subject: 'Mathematics',
                  teacher: 'Dr. Stone',
                  deadlineBackgroundColor: SchoolToolkitColors.darkYellow,
                  onUploadHandler: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
                child: AssignmentCard(
                  deadline: DateTime.now(),
                  question:
                      'Chapter 3 - Q.no 1 - Q.no 10 (Please submit in word format with names attached)',
                  subject: 'Mathematics',
                  teacher: 'Dr. Stone',
                  deadlineBackgroundColor: SchoolToolkitColors.red,
                  onUploadHandler: () {
                    print('Handle upload');
                  },
                  fileList: [
                    FileWrapper(
                      fileName: 'assignment-information.pdf',
                      fileSize: '11.5 KB',
                      onTap: () {
                        print('Handle on tap');
                      },
                    ),
                    FileWrapper(
                      fileName: 'assignment-information-2.pdf',
                      fileSize: '11.5 KB',
                      onTap: () {
                        print('Handle on tap');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
