import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';

class DeadlineCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deadline card'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DeadlineCard(
                deadline: DateTime.now(),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              DeadlineCard(
                deadline: DateTime.now(),
                secondaryColor: SchoolToolkitColors.darkYellow,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),
              DeadlineCard(
                deadline: DateTime.now(),
                secondaryColor: SchoolToolkitColors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
