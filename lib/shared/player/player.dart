import 'package:flutter/material.dart';

class NeteasePlayer extends StatefulWidget {
  @override
  _NeteasePlayerState createState() => _NeteasePlayerState();
}

class _NeteasePlayerState extends State<NeteasePlayer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('play_detail');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Color.fromRGBO(37, 37, 38, 1.0)
        ),
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                width: 50,
                height: 50.0,
                margin: EdgeInsets.only(left: 20.0),
                child: Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.white30
                    ),
                    borderRadius: BorderRadius.circular(99.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white38,
                        blurRadius: 2.0
                      )
                    ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(99.0),
                    child: Image.asset('assets/image/song_cover_default.jpeg'),
                  ),
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '歌曲名',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0
                      ),
                    ),
                    Text(
                      "歌词 歌词 歌词 歌词 歌词",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12.0
                      ),
                    )
                  ],
                ),
              )
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: 100.0,
                margin: EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 26.0,
                      height: 26.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(37, 37, 38, 1.0),
                        borderRadius: BorderRadius.circular(99.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white70,
                            blurRadius: 2.0
                          )
                        ]
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.centerLeft,
                        children: <Widget>[
                          CircularProgressIndicator(
                            value: 0.3,
                            backgroundColor: Colors.white70,
                            strokeWidth: 1.0,
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              child: Icon(IconData(
                                0xe65e,
                                fontFamily: 'iconfont'
                              ), color: Colors.white70, size: 16.0),
                            )
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: GestureDetector(
                        child: Icon(IconData(
                          0xe604,
                          fontFamily: 'iconfont'
                        ), color: Colors.white70, size: 24.0),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}