import 'package:flutter/material.dart';

import 'pd_actions.dart';

class NeteasePlayDetail extends StatefulWidget {
  @override
  _NeteasePlayDetailState createState() => _NeteasePlayDetailState();
}

class _NeteasePlayDetailState extends State<NeteasePlayDetail> {

  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play'),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Container(
              height: MediaQuery.of(context).size.width * 0.7,
              color: Colors.deepOrangeAccent,
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(28.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset('assets/image/song_cover_default.jpeg', fit: BoxFit.cover,),
                    )
                  );
                },
                itemCount: 6
              )
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text(
                'ELEKTRO',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(
                'Low asefvs',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),
              trailing: Icon(IconData(
                0xe616, fontFamily: "iconfont"
              )),
              dense: true,
            )
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color.fromRGBO(40, 40, 40, 1),
                      inactiveTrackColor: Color.fromRGBO(200, 200, 200, 1),
                      thumbColor: Colors.orangeAccent,
                      minThumbSeparation: 1.0
                    ),
                    child: Slider(
                      value: 30,
                      max: 100,
                      min: 0,
                      label: 'aaa',
                      onChanged: (double v) {

                      },
                    ),
                  )
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 22.0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("00:00"),
                      Text("03:15")
                    ],
                  )
                )
              ],
            )
          ),
          Expanded(
            flex: 3,
            child: new PdActions()
          )
        ],
      )
    );
  }
}