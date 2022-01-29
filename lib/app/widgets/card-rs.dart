import 'package:flutter/material.dart';

class CardRs extends StatelessWidget {
  CardRs({@required this.obj, @required this.index});

  final obj;
  final index;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Image.asset(obj["image"], width: 60),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Text(obj["name"], style: TextStyle(color: Colors.black)),
                ),
                Text(obj["alamat"]),
              ],
            )),
            Text('lihat detail', style: TextStyle(color: Colors.grey, fontSize: 12),)
          ],
        ));
  }
}
