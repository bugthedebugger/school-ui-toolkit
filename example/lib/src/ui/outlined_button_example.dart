import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart' as toolkit;

class OutlinedButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outlined Button'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: toolkit.OutlinedButton(
            label: 'Edit Info'.toUpperCase(),
            onPressed: () {},
            busy: true,
          ),
        ),
      ),
    );
  }
}
