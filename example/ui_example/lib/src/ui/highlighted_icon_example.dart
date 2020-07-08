import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class HighlightedIconExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School location widget'),
        centerTitle: true,
      ),
      body: Center(
        child: HighlightedIcon(
          icon: Icons.class_,
        ),
      ),
    );
  }
}
