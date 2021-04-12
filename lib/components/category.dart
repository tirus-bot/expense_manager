import 'package:flutter/material.dart';
import 'package:expense_managerr/constants.dart';

class CategoryButtons extends StatefulWidget {
  final IconData categoryIcon;
  final String categoryName;
  final Color colorCircleAvatarOutlined;
  final Color colorIcon;
  final Color colorCircleAvatarInline;

  CategoryButtons({
    this.categoryIcon,
    this.categoryName,
    this.colorCircleAvatarOutlined = Colors.green,
    this.colorIcon = Colors.green,
    this.colorCircleAvatarInline = Colors.white,
  });
  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 23.4,
          backgroundColor: widget.colorCircleAvatarOutlined,
          child: CircleAvatar(
            backgroundColor: widget.colorCircleAvatarInline,
            radius: 22.9,
            child: Icon(
              widget.categoryIcon,
              color: widget.colorIcon,
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.categoryName,
          style: textNormal,
        ),
      ],
    );
  }
}
