import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_ui_toolkit/src/colors/school_toolkit_colors.dart';
import 'package:school_ui_toolkit/src/font_size/font_size.dart';
import 'package:school_ui_toolkit/src/utils/screen_size.dart';

class VideoListTileCard extends StatelessWidget {
  final String title;
  final String author;
  final String thumbnailURL;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color color;
  final bool showIcon;
  final Function onTap;

  const VideoListTileCard({
    Key key,
    this.title,
    this.author,
    @required this.thumbnailURL,
    this.padding,
    this.margin,
    this.color = Colors.transparent,
    this.showIcon = true,
    this.onTap,
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

    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenUtil().setWidth(5.0),
        ),
        color: color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  ScreenUtil().setWidth(5),
                ),
                child: Container(
                  width: ScreenUtil().setWidth(60),
                  height: ScreenUtil().setWidth(60),
                  color: SchoolToolkitColors.black,
                  child: CachedNetworkImage(
                    imageUrl: thumbnailURL,
                    errorWidget: (context, string, _) => Container(),
                    width: ScreenUtil().setWidth(60),
                    height: ScreenUtil().setWidth(60),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(18),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(260),
                    child: Text(
                      '${title ?? 'Untitled Video'}',
                      style: TextStyle(
                        color: SchoolToolkitColors.darkBlack,
                        fontSize: FontSize.fontSize16,
                        fontWeight: FontSize.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      if (showIcon) ...[
                        Icon(
                          FontAwesomeIcons.userGraduate,
                          size: FontSize.fontSize16,
                          color: SchoolToolkitColors.grey,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                      ],
                      Container(
                        width: ScreenUtil().setWidth(234),
                        child: Text(
                          '${author ?? 'Unknown Author'}',
                          style: TextStyle(
                            color: SchoolToolkitColors.grey,
                            fontSize: FontSize.fontSize14,
                            fontWeight: FontSize.regular,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
