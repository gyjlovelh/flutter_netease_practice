import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/advertising/advertising.dart';
import 'pages/home/home.dart';
import 'pages/play_detail/play_detail.dart';
import 'pages/playlist/playlist.dart';

void main() => runApp(NeteaseApp());

class NeteaseApp extends StatefulWidget {
  @override
  _NeteaseAppState createState() => _NeteaseAppState();
}

class _NeteaseAppState extends State<NeteaseApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        initialRoute: "advertising",
        theme: ThemeData(
          primaryColor: Colors.white,
          // textSelectionColor: Colors.white
        ),
        routes: {
          "advertising": (BuildContext context) => new NeteaseAdvertising(),
          "home": (BuildContext context) => new NeteaseHome(),
          "playlist": (BuildContext context) => new NeteasePlaylist(),
          "play_detail": (BuildContext context) => new NeteasePlayDetail()
        }
      ),
    );
  }
}
