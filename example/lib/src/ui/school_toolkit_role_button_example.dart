import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';

class SchoolToolkitRoleButtonExample extends StatefulWidget {
  @override
  _SchoolToolkitRoleButtonExampleState createState() =>
      _SchoolToolkitRoleButtonExampleState();
}

class _SchoolToolkitRoleButtonExampleState
    extends State<SchoolToolkitRoleButtonExample> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School toolkit role button'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selected = !_selected;
              });
            },
            child: SchoolToolkitRoleButton(
              iconData: FontAwesomeIcons.userGraduate,
              label: 'Student'.toUpperCase(),
              selected: _selected,
            ),
          ),
        ),
      ),
    );
  }
}
