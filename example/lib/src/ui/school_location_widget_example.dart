import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class SchoolLocationWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('School location widget'),
        centerTitle: true,
      ),
      body: Center(
        child: SchoolLocationWidget(
          imageURL: 'http://via.placeholder.com/350x350',
          address:
              'Sallaghari, Bhaktapur asdf ad asdf asdf asdf asdf asdf asdf asdf ',
          name:
              'Nesfield int college asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf adf ',
        ),
      ),
    );
  }
}
