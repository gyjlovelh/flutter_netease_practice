import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeSong extends StatefulWidget {
  @override
  _HomeSongState createState() => _HomeSongState();
}

class _HomeSongState extends State<HomeSong> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 8.0
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "新歌速递",
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
          ),
          FutureBuilder(
            future: new Dio().get('http://106.14.154.205:3000/personalized/newsong'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                List songs = json.decode(snapshot.data.toString())['result'];
                return Column(
                  children: songs.map((item) {
                    return Material(
                      color: Colors.transparent,
                      child: ListTile(
                        onTap: () {},
                        leading: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 8.0,
                                offset: Offset(1.0, 1.0)
                              )
                            ]
                          ),
                          child:  ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network('${item['song']['album']['picUrl']}'),
                          ),
                        ),
                        title: Text(
                          '${item['name']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text('data'),
                        trailing: Icon(IconData(
                          0xe62b,
                          fontFamily: 'iconfont'
                        )),
                        dense: true,
                      ),
                    );
                  }).toList()
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}