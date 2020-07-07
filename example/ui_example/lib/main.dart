import 'package:flutter/material.dart';
import 'package:ui_example/src/assets/assets.dart';
import 'package:ui_example/src/ui/ui_catalog.dart';

void main() => runApp(UIExample());

class UIExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School UI Toolkit',
      builder: (context, child) {
        ScreenUtil.init(
          width: ScreenSize.width,
          height: ScreenSize.height,
          allowFontScaling: true,
        );
        return child;
      },
      home: UICatalog(),
    );
  }
}
