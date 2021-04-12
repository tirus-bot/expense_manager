import 'package:flutter/material.dart';

class SelectCategoryCircleAvatar extends StatelessWidget {
  final IconData icon;
  SelectCategoryCircleAvatar({this.icon});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22.4,
      backgroundColor: Colors.green,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 21,
        child: Icon(
          icon,
          color: Colors.green,
          size: 18,
        ),
      ),
    );
  }
}
