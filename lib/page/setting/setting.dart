import 'package:flutter/material.dart';
import 'package:mchat_app/utils/style.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More', style: UtilStyle.titleAppBarText,),
      ),
      body: Center(child: Text('Setting Page'),),
    );
  }
}
