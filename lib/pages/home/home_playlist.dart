import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePlaylist extends StatefulWidget {
  @override
  _HomePlaylistState createState() => _HomePlaylistState();
}

class _HomePlaylistState extends State<HomePlaylist> {
  // 水品边距
  final double horizontal = 18.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 18.0
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontal
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "推荐歌单",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace'
                ),
              ),
              FlatButton(
                child: Text('See all .'),
                onPressed: () {},
              )
            ],
          ),
          Container(
            // height: 200.0,
            child: FutureBuilder(
              future: new Dio().get('http://106.14.154.205:3000/personalized?limit=6'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List songs = json.decode(snapshot.data.toString())['result'];
                  var wrapSpacing = 12.0;
                  var width = MediaQuery.of(context).size.width;
                  var itemWidth = ((width - horizontal * 2.0 - wrapSpacing * 2.0) / 3).floor().toDouble();
                  
                  return Wrap(
                    spacing: wrapSpacing,
                    runSpacing: wrapSpacing,
                    children: songs.map((item) {

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('playlist', arguments: "${item['id']}");
                        },
                        child: Container(
                          height: itemWidth * 1.4,
                          width: itemWidth,
                          child: Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  bottom: 4.0
                                ),
                                height: itemWidth,
                                width: itemWidth,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage("${item['picUrl']}"),
                                    fit: BoxFit.cover
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      blurRadius: 4.0,
                                      offset: Offset(2.0, 2.0)
                                    )
                                  ]
                                )
                              ),
                              Text(
                                "${item['name']}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          )
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          )
        ],
      ),
    );
  }
}