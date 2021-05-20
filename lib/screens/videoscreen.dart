import 'package:akash_flutter_spotify_ui/data/data.dart';
import 'package:akash_flutter_spotify_ui/screens/nav_screen.dart';
import 'package:akash_flutter_spotify_ui/widgets/video_info.dart';
import 'package:akash_flutter_spotify_ui/widgets/videocard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';

class videoscreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomScrollView(
shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Consumer(
                builder: (context,watch, _){
                  final selectedVideo = watch(selectedVideoProvider).state;

                  return SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              selectedVideo!.thumbnailUrl,
                              height: 220.0,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              iconSize: 30.0,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              onPressed: () => context
                                  .read(miniPlayerControllerProvider)
                                  .state
                                  .animateToHeight(state: PanelState.MIN),
                            ),
                          ],
                        ),
                        const LinearProgressIndicator(
                          value: 0.4,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.red,
                          ),
                        ),
                        VideoInfo(video: selectedVideo),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final video = suggestedVideos[index];
                  return videocard(
                    video: video,


                  );
                },
                childCount: suggestedVideos.length,
              ),
            ),
          ],
        ),
      ),
    );

  }
}