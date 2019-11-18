import 'package:flutter/material.dart';
import 'package:netease_demo/shared/widget/gradient_text.dart';

import 'page_indicator.dart';
import 'pager_data.dart';

class NeteaseAdvertising extends StatefulWidget {
  @override
  _NeteaseAdvertisingState createState() => _NeteaseAdvertisingState();
}

class _NeteaseAdvertisingState extends State<NeteaseAdvertising> with TickerProviderStateMixin {
  PageController _controller;
  int currentPage = 0;

  AnimationController _animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = new PageController(initialPage: currentPage);
    _animationController = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween(begin: 0.6, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          PageView.builder(
            itemCount: pagerList.length,
            controller: _controller,
            onPageChanged: (int index) => setState(() => currentPage = index),
            itemBuilder: (BuildContext context, int index) => AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                var page = pagerList[index];
                var delta;
                var y = 1.0;

                if (_controller.position.haveDimensions) {
                  delta = _controller.page - index;
                  y = 1 - delta.abs().clamp(0.0, 1.0);
                }
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red[50], Colors.orange[50]],
                      tileMode: TileMode.clamp,
                      begin: Alignment.topCenter,
                      stops: [0.0, 1.0],
                      end: Alignment.bottomCenter
                    ),
                    image: DecorationImage(
                      image: AssetImage('${page.imageUrl}'),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 28.0,
                        bottom: 120.0
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          NeteaseGradientText(
                            "${page.title}",
                            gradient: LinearGradient(
                              colors: [Colors.purpleAccent[200], Colors.deepPurpleAccent]
                            ),
                            style: TextStyle(
                              fontSize: 42.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat-Black"
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(0, 40.0 * (1 - y), 0),
                            child: NeteaseGradientText(
                              "${page.subtitle}",
                              gradient: LinearGradient(
                                colors: [Colors.deepOrangeAccent[100], Colors.deepOrangeAccent[200]]
                              ),
                              style: TextStyle(
                                fontSize: 22.0,
                                fontFamily: "Montserrat-Black"
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                );
              },
            )
          ),
          Positioned(
            left: 20.0,
            bottom: 30.0,
            height: 30.0,
            width: 150.0,
            child: PageIndicator(
              currentPage: currentPage,
              pageCount: pagerList.length,
            ),
          ),
          Positioned(
            right: 20.0,
            bottom: 30.0,
            height: 30.0,
            width: 100.0,
            child: currentPage == pagerList.length - 1 ? FlatButton(
              color: Colors.deepOrangeAccent[200],
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(99.0)),
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
              textColor: Colors.white,
              child: Text('立即体验'),
            ) : Container()
          )
        ],
      )
    );
  }
}
