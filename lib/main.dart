import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/advertising/advertising.dart';
import 'pages/home/home.dart';

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
          primaryColor: Colors.orangeAccent,
          textSelectionColor: Colors.orangeAccent
        ),
        routes: {
          "advertising": (BuildContext context) => new NeteaseAdvertising(),
          "home": (BuildContext context) => new NeteaseHome()
        }
      ),
    );
  }
}
