import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:story_app/Screens/story/components/story_appbar.dart';
import 'package:story_view/story_view.dart';
import '../../data/models/storyModel.dart';
import 'components/body_story.dart';

class Story extends StatelessWidget {
  Story({super.key, required this.userstory});
  StoryModel userstory;
  final StoryController controller = StoryController();
  List<StoryItem?> item = [];
  @override
  Widget build(BuildContext context) {
    userstory.userStory!.forEach(
      (element) {
        if (element.type == Type.TEXT) {
          item.add(StoryItem.text(
              title: element.body!, backgroundColor: Colors.black));
        }
        if (element.type == Type.IMAGE) {
          item.add(
              StoryItem.pageImage(url: element.body!, controller: controller));
        }
      },
    );
    return Scaffold(
      body: Stack(children: [
        StoryView(
          onComplete: () => Navigator.of(context).pop(),
          storyItems: item,
          controller: controller,
        ),
        // Positioned(
        //   top: 16,
        //   left: 16,
        //   child: Image.network(userstory.userPhoto!),
        // )
      ]),
    );
  }
}
