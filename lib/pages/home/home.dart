import 'package:flutter/material.dart';
import 'package:netease_demo/shared/player/player.dart';

import 'home_playlist.dart';
import 'home_song.dart';
import 'home_swiper.dart';

class NeteaseHome extends StatefulWidget {
  @override
  _NeteaseHomeState createState() => _NeteaseHomeState();
}

class _NeteaseHomeState extends State<NeteaseHome> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    print(MediaQuery.of(context).devicePixelRatio);
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 50.0,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                      padding: EdgeInsets.symmetric(
                        horizontal: 18.0
                      ),
                      height: 60.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Music',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {},
                            iconSize: 24.0,
                            color: Colors.black87
                          )
                        ],
                      )
                    ),
                    ///轮播图
                    new HomeSwiper(),
                    new HomePlaylist(),
                    new HomeSong()
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 50.0,
              child: Container(
                child: new NeteasePlayer(),
              ),
            )
          ],
        )
      )
    );
  }
}