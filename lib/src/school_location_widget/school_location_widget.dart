import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/school_toolkit_card/school_toolkit_card.dart';

class SchoolLocationWidget extends StatelessWidget {
  final String imageURL;
  final String address;
  final String name;

  const SchoolLocationWidget({
    Key key,
    this.imageURL,
    this.address,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SchoolToolkitCard(
      width: 374,
      height: 97,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(67),
            width: ScreenUtil().setWidth(67),
            child: CachedNetworkImage(
              imageUrl: imageURL,
              width: ScreenUtil().setHeight(67),
              height: ScreenUtil().setWidth(67),
              placeholder: (context, string) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(17),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$name',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w500,
                  color: SchoolToolkitColors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: SchoolToolkitColors.blue,
                    size: ScreenUtil().setSp(18),
                  ),
                  Text(
                    '$address',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: SchoolToolkitColors.light_black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
