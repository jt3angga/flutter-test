import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  CardCategory(
      {@required this.selected, @required this.title, @required this.onTap});

  final selected;
  final onTap;
  final title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: selected ? Colors.black : Colors.grey,
              fontSize: 15,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal),
        )),
      ),
    );
  }
}
