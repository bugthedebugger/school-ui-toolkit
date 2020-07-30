import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ProfileCard(
          imageURL:
              'https://cdn1.iconfinder.com/data/icons/female-avatars-vol-1/256/female-portrait-avatar-profile-woman-sexy-afro-2-512.png',
          email: 'email@email.com',
          name: 'Dr. Steven Stones',
          phoneNumber: '9843XXXXXX',
          post: 'Sorceror',
          margin: EdgeInsets.all(5.0),
        ),
      ],
    );
  }
}
