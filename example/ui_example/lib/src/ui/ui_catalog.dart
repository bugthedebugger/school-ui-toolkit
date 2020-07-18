import 'package:flutter/material.dart';
import 'package:ui_example/src/assets/assets.dart';
import 'package:ui_example/src/ui/assignment_card_example.dart';
import 'package:ui_example/src/ui/bus_route_widget_example.dart';
import 'package:ui_example/src/ui/calendar_example.dart';
import 'package:ui_example/src/ui/deadline_card_example.dart';
import 'package:ui_example/src/ui/event_card_example.dart';
import 'package:ui_example/src/ui/featured_video_card_example.dart';
import 'package:ui_example/src/ui/grid_card.dart';
import 'package:ui_example/src/ui/highlighted_icon_example.dart';
import 'package:ui_example/src/ui/label_card_example.dart';
import 'package:ui_example/src/ui/nepali_calendar_example.dart';
import 'package:ui_example/src/ui/notice_card_example.dart';
import 'package:ui_example/src/ui/outlined_button_example.dart';
import 'package:ui_example/src/ui/profile_card_example.dart';
import 'package:ui_example/src/ui/routine_card_example.dart';
import 'package:ui_example/src/ui/school_location_widget_example.dart';
import 'package:ui_example/src/ui/school_toolkit_button.dart';
import 'package:ui_example/src/ui/school_toolkit_overlapping_card_example.dart';
import 'package:ui_example/src/ui/school_toolkit_role_button_example.dart';
import 'package:ui_example/src/ui/school_toolkit_text_field_example.dart';
import 'package:ui_example/src/ui/video_list_tile_card_example.dart';

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
            title: 'Outlined Button',
            screen: OutlinedButtonExample(),
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
            title: 'Nepali Calendar',
            screen: NepaliCalendarExample(),
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
          GridCard(
            title: 'Highlighted Icon',
            screen: HighlightedIconExample(),
          ),
          GridCard(
            title: 'Featured Video Card',
            screen: FeaturedVideoCardExample(),
          ),
          GridCard(
            title: 'Video List Tile Card',
            screen: VideoListtileCardExample(),
          ),
          GridCard(
            title: 'Profile Card',
            screen: ProfileCardExample(),
          ),
          GridCard(
            title: 'Bus Route Widget',
            screen: BusRouteWidgetExample(),
          ),
          GridCard(
            title: 'Notice Card',
            screen: NoticeCardExample(),
          ),
          GridCard(
            title: 'Label Card',
            screen: LabelCardExample(),
          ),
        ],
      ),
    );
  }
}
