import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';

class ProfileCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Card'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
          ScreenUtil().setWidth(12.0),
        ),
        child: ListView(
          children: [
            ProfileCard(
              imageURL:
                  'https://cdn1.iconfinder.com/data/icons/female-avatars-vol-1/256/female-portrait-avatar-profile-woman-sexy-afro-2-512.png',
              email: 'email@email.com',
              name: 'Dr. Steven Stones',
              phoneNumber: '9843XXXXXX',
              post: 'Sorceror',
              margin: EdgeInsets.all(5.0),
            ),
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
        ),
      ),
    );
  }
}
