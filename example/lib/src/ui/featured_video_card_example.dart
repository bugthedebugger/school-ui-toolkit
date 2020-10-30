import 'package:flutter/material.dart';
import 'package:school_ui_toolkit/school_ui_toolkit.dart';

class FeaturedVideoCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Video Card'),
        centerTitle: true,
      ),
      body: Center(
        child: FeaturedVideoCard(
          title: 'Professor KPR Lecture - Neuroscience Lecture 32',
          thumbnailURL:
              'https://www.teachermagazine.com.au/files/ce-image/cache/1c03ffc10fd4ef6a/Cognitive_load_theory_-_teaching_strategies_855_513_60.jpg',
          onTap: () {
            print('Handling on tap');
          },
        ),
      ),
    );
  }
}
