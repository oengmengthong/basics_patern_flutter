import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:mchat_app/page/contact/contacts.dart';
import 'package:mchat_app/page/setting/setting.dart';
import 'package:mchat_app/provider/searchChatprovider.dart';
import 'package:mchat_app/utils/style.dart';
import 'package:provider/provider.dart';

import 'chats/chats.dart';

class BaseViewPage extends StatefulWidget {
  @override
  _BaseViewPageState createState() => _BaseViewPageState();
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 20, color: color);
  }
}

class _BaseViewPageState extends State<BaseViewPage> {
  int _currentIndex = 0;

  List<Widget> _screen = [ChatsPage(), ContactPage(), SettingPage()];
  List<String> _title = ['Chat', 'Contact', 'More'];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _screen.length,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: _screen
              .map((i) => i)
              .toList(growable: false),
        ),
        bottomNavigationBar: StyleProvider(
          style: Style(),
          child: ConvexAppBar(
            height: 50,
            top: -20,
            curveSize: 80,
            color: Colors.white,
            style: TabStyle.custom,
            activeColor: Colors.white,
            items: [
              TabItem(
                  icon: Icons.chat_bubble,
                  isIconBlend: true,
                  activeIcon: Icon(Icons.chat_bubble, size: 30)),
              TabItem(
                  icon: Icons.contact_phone,
                  isIconBlend: true,
                  activeIcon: Icon(Icons.contact_phone, size: 30)),
              TabItem(
                  icon: Icons.more_horiz,
                  isIconBlend: true,
                  activeIcon: Icon(Icons.more_horiz, size: 30)),
            ],
            backgroundColor: Colors.teal,
            // cornerRadius: 25,
          ),
        ),
      ),
    );
  }
}
