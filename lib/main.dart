import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/advertising/advertising.dart';
import 'pages/login/login.dart';

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
        routes: {
          "advertising": (BuildContext context) => new NeteaseAdvertising(),
          "login": (BuildContext context) => new NeteaseLogin()
        }
      ),
    );
  }
}
