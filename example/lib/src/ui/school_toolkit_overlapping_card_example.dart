import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';

class SchoolToolkitOverlappingButtonCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SchoolToolkitColors.blue,
      appBar: AppBar(
        title: Text('School toolkit overlapping button card'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: OverlappingButtonCard(
            width: ScreenUtil().setWidth(354),
            height: ScreenUtil().setHeight(589),
            label: 'Button label'.toUpperCase(),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
