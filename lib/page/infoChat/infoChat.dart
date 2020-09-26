import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              elevation: 0.0,
              pinned: true,
              actions: [IconButton(icon: Icon(FontAwesomeIcons.solidEdit, size: 20,), onPressed: () {})],
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("MGroup",
                      style: TextStyle(color: Colors.teal, fontSize: 16.0)),
                  background: Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.cyan,
                      child: Text('M',
                          style: TextStyle(fontSize: 40, color: Colors.white)),
                    ),
                  )),
            ),
          ];
        },
        body: Center(child: Text("Sample Text")),
      ),
    );
  }
}
