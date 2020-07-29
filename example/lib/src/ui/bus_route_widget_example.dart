import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';

class BusRouteWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Route Widget'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Divider(),
              InformationTileWidget(
                margin: EdgeInsets.all(5.0),
                icon: FontAwesomeIcons.bus,
                biggerTitle: true,
                title: 'Bus Route 1',
                subTitle: 'Tinkune-Dhobhighat-NewRoad',
                iconColor: Colors.white,
                rounded: false,
                iconBackgroundColor: SchoolToolkitColors.blue,
              ),
              Divider(),
              InformationTileWidget(
                margin: EdgeInsets.all(5.0),
                icon: FontAwesomeIcons.bus,
                biggerTitle: true,
                title: 'Bus Route 2',
                subTitle: 'Tinkune-Dhobhighat-NewRoad',
                iconColor: Colors.white,
                rounded: false,
                iconBackgroundColor: SchoolToolkitColors.blue,
              ),
              Divider(),
              InformationTileWidget(
                margin: EdgeInsets.all(5.0),
                icon: FontAwesomeIcons.bus,
                biggerTitle: true,
                title: 'Bus Route 3',
                subTitle: 'Tinkune-Dhobhighat-NewRoad',
                iconColor: Colors.white,
                rounded: false,
                iconBackgroundColor: SchoolToolkitColors.blue,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
