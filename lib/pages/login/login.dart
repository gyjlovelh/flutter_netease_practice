import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeteaseLogin extends StatefulWidget {
  @override
  _NeteaseLoginState createState() => _NeteaseLoginState();
}

class _NeteaseLoginState extends State<NeteaseLogin> {

  Future<bool> _requestPop() {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) => new AlertDialog(content: new Text('退出网易云音乐？'), actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: new Text(
            '取消',
            // style: TextStyle(
            //   color: Theme.of(context).dialogTheme.titleTextStyle.color
            // ),
          )
        ),
        new FlatButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          child: new Text(
            '确定',
            // style: TextStyle(
            //   color: Theme.of(context).dialogTheme.titleTextStyle.color
            // ),
          )
        )
      ]),
    );
    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            fit: StackFit.loose,
            children: <Widget>[
              SizedBox(
                height: 300.0,
                child: ClipPath(
                  clipper: BottomClipper(),
                  child: Container(
                      child: Image.asset(
                    'assets/image/login_cover.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 4 * 3, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}