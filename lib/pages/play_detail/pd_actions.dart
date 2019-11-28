import 'package:flutter/material.dart';

class PdActions extends StatefulWidget {
  @override
  _PdActionsState createState() => _PdActionsState();
}

class _PdActionsState extends State<PdActions> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        actionItem('\u{E6b4}'),
        actionItem('\u{E635}'),
        actionItem('\u{E63d}', size: 48),
        actionItem('\u{E63a}'),
        actionItem('\u{E63c}'),
      ],
    );
  }

  Widget actionItem(String pointer, {
    double size,
    Color color
  }) {
    return GestureDetector(
      onTap: () {},
      onForcePressStart: (ForcePressDetails details) {

      },
      child: Container(
        child: Text(
          "$pointer",
          style: TextStyle(
            color: color ?? Color.fromRGBO(40, 40, 40, 1),
            fontSize: size ?? 32.0,
            fontFamily: "iconfont",
            shadows: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(3, 4)
              )
            ]
          ),
        )
      )
    );
  }
}

class _ActionIconButton extends StatefulWidget {
  @override
  _ActionIconButtonState createState() => _ActionIconButtonState();
}

class _ActionIconButtonState extends State<_ActionIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}