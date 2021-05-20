import 'package:akash_flutter_spotify_ui/data/data.dart';
import 'package:akash_flutter_spotify_ui/screens/videoscreen.dart';
import 'package:flutter/material.dart';
import 'package:akash_flutter_spotify_ui/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miniplayer/miniplayer.dart';

final selectedVideoProvider = StateProvider<Video?>((ref) => null);


final miniPlayerControllerProvider = StateProvider.autoDispose<MiniplayerController>(
    (ref) => MiniplayerController(),
);

class navscreen extends StatefulWidget {
  @override
  _navscreenState createState() => _navscreenState();
}

class _navscreenState extends State<navscreen> {
  static const double _playerminheight = 60.0;

  int _selectedindex = 0;
  final _screens = [
    homescreen(),
    Scaffold(
      body: Center(
        child: Text('Explore'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Add'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Subscription'),
      ),
    ),
    Scaffold(
      body: Center(
        child: Text('Library'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, watch, _) {
          final selectedVideo = watch(selectedVideoProvider).state;

          final miniPlayerController =
              watch(miniPlayerControllerProvider).state;


          return Stack(
              children: _screens
                  .asMap()
                  .map((i, screen) => MapEntry(
                        i,
                        Offstage(
                          offstage: _selectedindex != i,
                          child: screen,
                        ),
                      ))
                  .values
                  .toList()
                    ..add(Offstage(
                      offstage: selectedVideo == null,
                      child: Miniplayer(
                          minHeight: _playerminheight,
                          maxHeight: MediaQuery.of(context).size.height,
                          builder: (height, percentage) {
                            if (selectedVideo == null)
                              return const SizedBox.shrink();
                            if (height <= _playerminheight + 50.0)
                            return Container(
                              color: Colors.grey,
                              child: Center(
                                child: Column(

                                  children: [
                                    Row(
                                      children: [
                                        Image.network(selectedVideo.thumbnailUrl,height: _playerminheight - 4.0,
                                          width: 120.0,
                                          fit: BoxFit.cover,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    selectedVideo.title,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    selectedVideo.author.username,
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption!
                                                        .copyWith(
                                                        fontWeight:
                                                        FontWeight.w500),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.play_arrow),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            context
                                                .read(selectedVideoProvider)
                                                .state = null;
                                          },
                                        ),
                                      ],
                                    ),

                                    const LinearProgressIndicator(
                                      value: 0.4,
                                      valueColor: AlwaysStoppedAnimation(Colors.orange),
                                    )
                                  ],
                                )
                              ),
                            );
                            return videoscreen();
                          }),
                    )));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10.0,
        unselectedFontSize: 10.0,
        currentIndex: _selectedindex,
        onTap: (i) {
          setState(() {
            _selectedindex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_off_outlined),
              activeIcon: Icon(Icons.explore),
              label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(Icons.add_circle),
              label: "Add"),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              activeIcon: Icon(Icons.subscriptions),
              label: "Subscription"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined),
              activeIcon: Icon(Icons.video_library),
              label: "Library"),
        ],
      ),
    );
  }
}
