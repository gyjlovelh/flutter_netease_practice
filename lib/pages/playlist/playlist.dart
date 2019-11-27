
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:netease_demo/enums/response_status.dart';
import 'package:netease_demo/models/playlist.dart';
import 'package:netease_demo/models/song.dart';

class NeteasePlaylist extends StatefulWidget {
  @override
  _NeteasePlaylistState createState() => _NeteasePlaylistState();
}

class _NeteasePlaylistState extends State<NeteasePlaylist> {

  PlaylistModel playlist;
  ResponseStatus status = ResponseStatus.UNINIT;

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context).settings.arguments;
    if (status == ResponseStatus.UNINIT) {
      loadPageData(playlistId: id);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('歌单'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(1, 1),
                      colors: [Color.fromRGBO(40, 61, 76, 1), Color.fromRGBO(69, 105, 123, 1)]
                    ),
                  ),
                  height: MediaQuery.of(context).size.width * 0.45,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.0
                    ),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network("${playlist?.coverImgUrl}"),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 12.0
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  "${playlist?.name}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                                Text(
                                  "${playlist?.description}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                )
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ),
                floatButton(right: 30.0, bottom: -30.0)
              ],
            )
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverStickyDelegate(
              minHeight: 50.0,
              maxHeight: 50.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset(0, 0),
                    end: FractionalOffset(1, 1),
                    colors: [Color.fromRGBO(40, 61, 76, 1), Color.fromRGBO(69, 105, 123, 1)]
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.0
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)
                    )
                  ),
                  child: Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      Text(
                        "歌曲列表",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      floatButton(right: 12.0, top: -20.0)
                    ],
                  ),
                ),
              )
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              SongModel song = playlist.tracks[index];

              return Material(
                color: Colors.transparent,
                child: ListTile(
                  onTap: () {},
                  leading: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4.0,
                          offset: Offset(1.0, 1.0)
                        )
                      ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network("${song.al.picUrl}"),
                    ),
                  ),
                  title: Text(
                    '${song.name}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text("${song.ar.map((item) => item.name).join(',')}"),
                  trailing: GestureDetector(
                    child: Icon(IconData(
                      0xe62b,
                      fontFamily: 'iconfont'
                    )),
                  ),
                  dense: true,
                ),
              );
            }, childCount: playlist == null ? 0 : playlist.tracks.length),
          )
        ],
      ),
    );
  }

  void loadPageData({String playlistId}) async {
    setState(() {
      status = ResponseStatus.LOADING;
    });
    Response result = await new Dio().get('http://106.14.154.205:3000/playlist/detail', queryParameters: {"id": "$playlistId"});
    
    var model = PlaylistModel.fromJson(result.data['playlist']);
    setState(() {
      playlist = model;
      status = ResponseStatus.LOADED;
    });
  }

  Widget floatButton({
    double left,
    double right,
    double top,
    double bottom
  }) {
    return Positioned(
      right: right,
      bottom: bottom,
      left: left,
      top: top,
      width: 50.0,
      height: 50.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(1, 1),
            colors: [Color.fromRGBO(40, 61, 76, 1), Color.fromRGBO(69, 105, 123, 1)]
          ),
          borderRadius: BorderRadius.circular(99.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(69, 105, 123, 1),
              blurRadius: 2.0
            )
          ]
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(IconData(
            0xe65e, fontFamily: 'iconfont'
          ), color: Colors.white70),
        )
      ),
    );
  }
}

class _SliverStickyDelegate extends SliverPersistentHeaderDelegate {
  _SliverStickyDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverStickyDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

