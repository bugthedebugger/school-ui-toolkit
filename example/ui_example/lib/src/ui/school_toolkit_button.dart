import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class SchoolToolkitButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School toolkit button widget'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SchoolToolkitButton(
            onPressed: () {},
            busy: true,
            label: 'Text Label'.toUpperCase(),
          ),
        ),
      ),
    );
  }
}
