import 'package:akash_flutter_spotify_ui/data/data.dart';
import 'package:akash_flutter_spotify_ui/widgets/custom_silver_bar.dart';
import 'package:akash_flutter_spotify_ui/widgets/videocard.dart';
import 'package:flutter/material.dart';

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          customsilverbar(),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 60.0),
            sliver: SliverList(delegate: SliverChildBuilderDelegate((context, index){
              final video = videos[index];
              return videocard(video: video);
            },
            childCount: videos.length)
            ),
          ),
        ],
      ),
    );
  }
}
