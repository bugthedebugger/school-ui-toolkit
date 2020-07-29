import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class HighlightedIconExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Highlighted Icon'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            HighlightedIcon(
              icon: Icons.class_,
              busy: true,
            ),
            HighlightedIcon(
              icon: Icons.class_,
            ),
          ],
        ),
      ),
    );
  }
}
