import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final IconData icon;
  final String categoryName;
  final String price;
  final String typeTransaction;
  final dynamic now;
  ListItem(
      {this.icon,
      this.categoryName,
      this.price,
      this.now,
      this.typeTransaction});
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isTrue;
  bool colorPicker() {
    if (widget.typeTransaction == 'New Transaction') {
      isTrue = true;
      return isTrue;
    } else {
      isTrue = false;
      return isTrue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 43,
          width: 43,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Icon(
            widget.icon,
            color: Colors.white,
            size: 18,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          width: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.categoryName,
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${widget.now}',
                style: TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 208,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Ksh ${widget.price}',
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: widget.typeTransaction == 'New Income Stream'
                    ? Colors.green[700]
                    : Colors.red[400],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
