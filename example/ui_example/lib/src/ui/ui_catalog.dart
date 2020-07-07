import 'package:flutter/material.dart';
import 'package:ui_example/src/assets/assets.dart';
import 'package:ui_example/src/ui/school_location_widget_example.dart';

class UICatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Catalog'),
        centerTitle: true,
      ),
      body: GridView(
        padding: EdgeInsets.all(
          ScreenUtil().setWidth(10),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SchoolLocationWidgetExample(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(200),
              height: ScreenUtil().setHeight(100),
              color: Colors.black45,
              child: Text('School location widget'),
            ),
          ),
        ],
      ),
    );
  }
}
