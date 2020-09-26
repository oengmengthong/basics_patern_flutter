import 'package:flutter/material.dart';
import 'package:mchat_app/utils/style.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts Book', style: UtilStyle.titleAppBarText,),
      ),
      body: Center(child: Text('Contact Page'),),
    );
  }
}
