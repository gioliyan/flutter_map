import 'package:flutter/material.dart';

class riwayatkonversi extends StatelessWidget {
  riwayatkonversi({
    Key key,
    @required this.listViewItem,
  }) : super(key: key);

  List<String> listViewItem = List<String>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
            children: listViewItem.map((String value) {
      return Container(
          margin: EdgeInsets.all(10),
          child: Text(
            value,
            style: TextStyle(fontSize: 15),
          ));
    }).toList()));
  }
}
