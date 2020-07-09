import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class VideoListtileCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video List Tile Card'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              VideoListTileCard(
                author: 'Dr. Stone',
                title: 'The dawn of the mankind.',
                margin: EdgeInsets.all(5.0),
                thumbnailURL:
                    'https://www.teachermagazine.com.au/files/ce-image/cache/1c03ffc10fd4ef6a/Cognitive_load_theory_-_teaching_strategies_855_513_60.jpg',
              ),
              VideoListTileCard(
                author: 'Dr. Richard',
                title: 'The science of gamma radiation.',
                margin: EdgeInsets.all(5.0),
                thumbnailURL:
                    'https://www.teachermagazine.com.au/files/ce-image/cache/1c03ffc10fd4ef6a/Cognitive_load_theory_-_teaching_strategies_855_513_60.jpg',
              ),
              VideoListTileCard(
                author: 'Dr. Strange',
                title: 'Dormamu I\'m coming for you',
                margin: EdgeInsets.all(5.0),
                thumbnailURL:
                    'https://www.teachermagazine.com.au/files/ce-image/cache/1c03ffc10fd4ef6a/Cognitive_load_theory_-_teaching_strategies_855_513_60.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
