import 'package:flutter/material.dart';

import 'pd_actions.dart';

class NeteasePlayDetail extends StatefulWidget {
  @override
  _NeteasePlayDetailState createState() => _NeteasePlayDetailState();
}

class _NeteasePlayDetailState extends State<NeteasePlayDetail> {
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
              trailing: Icon(Icons.headset_off),
            )
          ),
          Expanded(
            flex: 2,
            child: Container(color: Colors.indigo),
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