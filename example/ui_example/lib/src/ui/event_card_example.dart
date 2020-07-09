import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';

class EventCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event card'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EventCard(
              event: 'Sports week Class 3 - Class 10',
              time: '1:00 - 3:00 PM',
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            EventCard(
              event: 'Sports week Class 3 - Class 10',
              time: '1:00 - 3:00 PM',
              primaryColor: SchoolToolkitColors.green,
              secondaryColor: SchoolToolkitColors.lightGreen,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            EventCard(
              event: 'Sports week Class 3 - Class 10',
              time: '1:00 - 3:00 PM',
              secondaryColor: SchoolToolkitColors.lighterGrey,
              primaryColor: SchoolToolkitColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
