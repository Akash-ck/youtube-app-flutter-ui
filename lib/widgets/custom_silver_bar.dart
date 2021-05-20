
import 'package:flutter/material.dart';

class customsilverbar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      floating: true,
      leadingWidth: 100,
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset("assets/yt_logo_dark.png"),
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.cast)),
        IconButton(onPressed: (){}, icon: Icon(Icons.notification_add_outlined)),
        IconButton(onPressed: (){}, icon: Icon(Icons.search)),
        IconButton(onPressed: (){}, icon: Icon(Icons.circle)),
      ],
    );

  }
}
