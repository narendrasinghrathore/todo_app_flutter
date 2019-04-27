import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key key, this.itemName}) : super(key: key);

  final String itemName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100.0,
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print('Tapped');
        },
        child: Row(
          children: <Widget>[
            Padding(
              child: Icon(Icons.note, size: 60.0,),
              padding: EdgeInsets.all(10.0),
            ),
            Text(this.itemName,style: TextStyle(fontSize: 24.0),)
          ],
        ),
      ),
    );
  }
}
