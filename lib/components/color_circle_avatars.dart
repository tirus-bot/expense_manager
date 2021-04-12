import 'package:flutter/material.dart';

class ColorCircleAvatar extends StatefulWidget {
  final Color color;
  ColorCircleAvatar({this.color});
  @override
  _ColorCircleAvatarState createState() => _ColorCircleAvatarState();
}

class _ColorCircleAvatarState extends State<ColorCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: widget.color,
    );
  }
}
