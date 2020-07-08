import 'package:flutter/material.dart';
import 'package:ui_example/src/assets/assets.dart';
import 'package:ui_example/src/ui/assignment_card_example.dart';
import 'package:ui_example/src/ui/calendar_example.dart';
import 'package:ui_example/src/ui/deadline_card_example.dart';
import 'package:ui_example/src/ui/event_card_example.dart';
import 'package:ui_example/src/ui/grid_card.dart';
import 'package:ui_example/src/ui/routine_card_example.dart';
import 'package:ui_example/src/ui/school_location_widget_example.dart';
import 'package:ui_example/src/ui/school_toolkit_button.dart';
import 'package:ui_example/src/ui/school_toolkit_overlapping_card_example.dart';
import 'package:ui_example/src/ui/school_toolkit_role_button_example.dart';
import 'package:ui_example/src/ui/school_toolkit_text_field_example.dart';

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
          GridCard(
            title: 'School toolkit text field',
            screen: SchoolToolkitTextFieldExample(),
          ),
          GridCard(
            title: 'School toolkit role button',
            screen: SchoolToolkitRoleButtonExample(),
          ),
          GridCard(
            title: 'School toolkit overlapping button card',
            screen: SchoolToolkitOverlappingButtonCardExample(),
          ),
          GridCard(
            title: 'Calendar',
            screen: CalendarExample(),
          ),
          GridCard(
            title: 'Event Card',
            screen: EventCardExample(),
          ),
          GridCard(
            title: 'Routine Card',
            screen: RoutineCardExample(),
          ),
          GridCard(
            title: 'Deadline Card',
            screen: DeadlineCardExample(),
          ),
          GridCard(
            title: 'Assignment Card',
            screen: AssignmentCardExample(),
          ),
        ],
      ),
    );
  }
}
