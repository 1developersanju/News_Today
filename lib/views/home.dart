import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class NewsHome extends StatefulWidget {
  //NewsHome({Key key}) : super(key: key);

  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          "News".text.makeCentered(),
          "Today".text.yellow400.makeCentered(),
        ]),
      ),
      backgroundColor: Colors.black,
      body: Container(
        child: ,
      ),
    );
  }
}
