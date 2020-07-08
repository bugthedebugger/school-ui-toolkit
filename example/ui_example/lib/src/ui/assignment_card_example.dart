import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';

class AssignmentCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School toolkit text field'),
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
                  deadlineBackgroundColor: SchoolToolkitColors.dark_yellow,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
