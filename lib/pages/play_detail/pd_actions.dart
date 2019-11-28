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
        _ActionIconButton('\u{E6b4}', onPressed: () {}),
        _ActionIconButton('\u{E635}', onPressed: () {}),
        _ActionIconButton('\u{E63d}', size: 48, onPressed: () {}),
        _ActionIconButton('\u{E63a}', onPressed: () {}),
        _ActionIconButton('\u{E63c}', onPressed: () {}),
      ],
    );
  }
}

class _ActionIconButton extends StatefulWidget {
  final String pointer;
  final double size;
  final Color color;
  final VoidCallback onPressed;

  _ActionIconButton(this.pointer, {
    this.size,
    this.color,
    @required this.onPressed
  });

  @override
  _ActionIconButtonState createState() => _ActionIconButtonState();
}

class _ActionIconButtonState extends State<_ActionIconButton> {
  bool isForce = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onForcePressStart: (ForcePressDetails details) {
        setState(() {
          isForce = true;
        });
      },
      onForcePressEnd: (ForcePressDetails details) {

      },
      onTap: () {
       
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          isForce = true;
        });
      },
      onTapUp: (TapUpDetails details) {
        setState(() {
          isForce = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isForce = false;
        });
      },
      child: Container(
        child: Text(
          "${widget.pointer}",
          style: TextStyle(
            color: isForce ? Colors.redAccent : (widget.color ?? Color.fromRGBO(40, 40, 40, 1)),
            fontSize: widget.size ?? 32.0,
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