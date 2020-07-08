import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';

class RoutineCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routine Card'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RoutineCard(
              classTopic: 'Fundamentals of Mathematics',
              classType: 'Theory Class',
              subject: 'Mathematics',
              professor: 'Mr. Ram Prasad Yadav',
              time: '8:00 - 9:00 AM',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            RoutineCard(
              classTopic: 'Pully chain',
              classType: 'Practical Class',
              subject: 'Physics',
              professor: 'Mr. Ram Prasad Yadav',
              time: '10:00 - 11:00 AM',
            ),
          ],
        ),
      ),
    );
  }
}
