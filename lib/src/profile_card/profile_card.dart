import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/information_tile_widget/information_tile_widget.dart';
import 'package:school_ui_toolkit/src/school_toolkit_card/school_toolkit_card.dart';
import 'package:school_ui_toolkit/src/video_list_tile_card/video_list_tile_card.dart';

class ProfileCard extends StatelessWidget {
  final String imageURL;
  final String name;
  final String post;
  final String email;
  final String phoneNumber;
  final EdgeInsets margin;

  const ProfileCard({
    Key key,
    @required this.imageURL,
    this.name,
    this.post,
    this.email,
    this.phoneNumber,
    this.margin,
  })  : assert(imageURL != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SchoolToolkitCard(
      margin: margin,
      backgroundColor: Colors.white,
      showShadow: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          VideoListTileCard(
            title: '$name',
            author: '$post',
            thumbnailURL: imageURL,
            showIcon: false,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(15),
          ),
          SchoolToolkitCard(
            backgroundColor: SchoolToolkitColors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InformationTileWidget(
                  icon: FontAwesomeIcons.envelope,
                  title: 'Email',
                  subTitle: '$email',
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(10),
                ),
                InformationTileWidget(
                  icon: FontAwesomeIcons.phoneAlt,
                  title: 'Phone Number',
                  subTitle: '$phoneNumber',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
