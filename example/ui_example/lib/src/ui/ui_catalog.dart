import 'package:flutter/material.dart';
import 'package:ui_example/src/assets/assets.dart';
import 'package:ui_example/src/ui/grid_card.dart';
import 'package:ui_example/src/ui/school_location_widget_example.dart';
import 'package:ui_example/src/ui/school_toolkit_button.dart';

class UICatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Catalog'),
        centerTitle: true,
      ),
      body: GridView(
        padding: EdgeInsets.all(
          ScreenUtil().setWidth(10),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        children: <Widget>[
          GridCard(
            title: 'School location widget',
            screen: SchoolLocationWidgetExample(),
          ),
          GridCard(
            title: 'School toolkit button widget',
            screen: SchoolToolkitButtonExample(),
          ),
        ],
      ),
    );
  }
}
