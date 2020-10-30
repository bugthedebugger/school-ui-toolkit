import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';
import 'package:ui_example/src/assets/assets.dart';
import 'package:ui_example/src/ui/ui_catalog.dart';

void main() => runApp(UIExample());

class UIExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School UI Toolkit',
      theme: ThemeData(
        primaryColor: SchoolToolkitColors.blue,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      builder: (context, child) {
        ScreenUtil.init(
<<<<<<< HEAD
          context,
          designSize: Size(ScreenSize.width, ScreenSize.height),
          allowFontScaling: true,
        );
=======
        context,
        designSize :Size( ScreenSize.width,
         ScreenSize.height,),
        allowFontScaling: true,
      );
>>>>>>> d97c3b67a56743811acbc1a9b1ae7f6b76a60400
        return child;
      },
      home: UICatalog(),
    );
  }
}
