import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input.dart';

class NeteaseLogin extends StatefulWidget {
  @override
  _NeteaseLoginState createState() => _NeteaseLoginState();
}

class _NeteaseLoginState extends State<NeteaseLogin> {
  TextEditingController _mobileController;
  TextEditingController _passwordController;
  bool _rememberMe = false;

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

  Widget horizontalLine() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 13.0),
    child: Container(
      width: 80.0,
      height: 1.0,
      color: Colors.grey.withOpacity(0.2),
    ),
  );

  @override
  void initState() {
    super.initState();
    _mobileController = new TextEditingController();
    _passwordController = new TextEditingController();
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
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 350.0,
                child: ClipPath(
                  clipper: BottomClipper(),
                  child: Container(
                      child: Image.asset(
                    'assets/image/login_cover.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )),
                ),
              ),
              Center(
                child: Container(
                  height: 400,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 350.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 28.0
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Input(
                        controller: _mobileController,
                        hintText: '请填写手机号',
                        prefixIcon: Icons.phone_android,
                        keyboardType: TextInputType.phone,
                      ),
                      Input(
                        controller: _passwordController,
                        hintText: '请填写密码',
                        prefixIcon: Icons.lock,
                        obscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: _rememberMe,
                                activeColor: Theme.of(context).textSelectionColor,
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value;
                                  });
                                },
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _rememberMe = !_rememberMe;
                                  });
                                },
                                child: Text('记住我',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    )),
                              ),
                            ],
                          ),
                          GestureDetector(
                            child: Text('忘记密码?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              )),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40.0,
                        child: FlatButton(
                          child: Text(
                            '登 录',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.orangeAccent,
                          onPressed: () {},
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          horizontalLine(),
                          Text('其他方式登录',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey)),
                          horizontalLine()
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CustomLoginTypeIcon(0xe623),
                            CustomLoginTypeIcon(0xe606),
                            CustomLoginTypeIcon(0xe681)
                          ],
                        ),
                      )
                    ],
                  ),
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
    var firstEndPoint = Offset(size.width / 2.1, size.height - 30);

    path.quadraticBezierTo(
      firstControlPoint.dx, 
      firstControlPoint.dy,
      firstEndPoint.dx, 
      firstEndPoint.dy
    );

    var secondControlPoint = Offset(size.width / 4 * 3, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx, 
      secondEndPoint.dy
    );

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomLoginTypeIcon extends StatelessWidget {
  final int pointer;

  CustomLoginTypeIcon(
    this.pointer,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        IconData(pointer, fontFamily: 'iconfont'),
        size: 24.0,
        color: Theme.of(context).textSelectionColor.withOpacity(0.8),
      ),
    );
  }
}
