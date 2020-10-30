import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class FeaturedVideoCard extends StatelessWidget {
  final String thumbnailURL;
  final Function onTap;
  final String title;

  const FeaturedVideoCard({
    Key key,
    @required this.thumbnailURL,
    this.onTap,
    this.title,
  })  : assert(thumbnailURL != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ScreenUtil() == null) {
      ScreenUtil.init(
        context,
        designSize: Size(
          ScreenSize.width,
          ScreenSize.height,
        ),
        allowFontScaling: true,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        ScreenUtil().setWidth(10),
      ),
      child: Container(
        width: ScreenUtil().setWidth(374),
        height: ScreenUtil().setHeight(222),
        color: SchoolToolkitColors.black,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CachedNetworkImage(
              width: ScreenUtil().setWidth(374),
              height: ScreenUtil().setHeight(222),
              fit: BoxFit.cover,
              imageUrl: thumbnailURL,
            ),
            Opacity(
              opacity: 0.35,
              child: Container(
                width: ScreenUtil().setWidth(374),
                height: ScreenUtil().setHeight(222),
                color: SchoolToolkitColors.black,
              ),
            ),
            Icon(
              FontAwesomeIcons.playCircle,
              color: Colors.white,
              size: FontSize.fontSize36,
            ),
            Positioned(
              bottom: ScreenUtil().setHeight(10),
              left: ScreenUtil().setWidth(20),
              child: Container(
                width: 315,
                child: Text(
                  '${title ?? 'Untitled'}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSize.fontSize16,
                    fontWeight: FontSize.bold,
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  width: ScreenUtil().setWidth(374),
                  height: ScreenUtil().setHeight(222),
                  // color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
