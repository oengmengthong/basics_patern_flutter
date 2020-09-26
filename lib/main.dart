import 'package:flutter/material.dart';
import 'package:mchat_app/page/auth/login.dart';
import 'package:mchat_app/page/baseView.dart';
import 'package:mchat_app/provider/groupChatProvider.dart';
import 'package:mchat_app/provider/searchChatprovider.dart';
import 'package:mchat_app/provider/todoListprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GroupChatProvider()),
        ChangeNotifierProvider(create: (_) => SearchChatProvider()),
        ChangeNotifierProvider(create: (_) => ToDoListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MChat',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: Colors.teal,
            visualDensity: VisualDensity.adaptivePlatformDensity,

            appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.teal),
                elevation: 0.0, centerTitle: true, color: Colors.transparent)),
        home: BaseViewPage(),
      ),
    );
  }
}
