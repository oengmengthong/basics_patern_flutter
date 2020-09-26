import 'dart:async';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:mchat_app/model/chatData.dart';
import 'package:mchat_app/page/infoChat/infoChat.dart';
import 'package:mchat_app/provider/groupChatProvider.dart';
import 'package:mchat_app/provider/todoListprovider.dart';
import 'package:mchat_app/utils/func.dart';
import 'package:mchat_app/utils/style.dart';
import 'package:mchat_app/utils/widget.dart';
import 'package:provider/provider.dart';

class GroupChatViewPage extends StatefulWidget {
  @override
  _GroupChatViewPageState createState() => _GroupChatViewPageState();
}

class _GroupChatViewPageState extends State<GroupChatViewPage> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  TextEditingController _editingController = new TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _max = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        setState(() {
          _max = false;
        });
      } else {
        setState(() {
          _max = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    GroupChatProvider groupChatProvider =
        Provider.of<GroupChatProvider>(context);
    ToDoListProvider toDoListProvider = Provider.of<ToDoListProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        key: _globalKey,
        appBar: AppBar(
          title: Text('Mgroup', style: UtilStyle.titleAppBarText,),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InfoPage())),
              icon: Icon(Icons.info_outline),
            )
          ],
        ),
        body: SafeArea(
          child: Stack(children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      controller: _scrollController,
                      reverse: true,
                      itemCount: groupChatProvider.data.length,
                      itemBuilder: (context, index) {
                        return _chatContent(
                          data: groupChatProvider.data[index],
                          toDoListProvider: toDoListProvider
                        );
                      }),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.photo, color: Colors.teal),
                    ),
                    Expanded(
                        child: TextField(
                      controller: _editingController,
                      decoration: InputDecoration(
                          hintText: 'Write Something Here!',
                          hintStyle: UtilStyle.placeHolderText,
                          labelStyle: UtilStyle.normalText,
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent))),
                    )),
                    IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          if (_editingController.text.length > 0) {
                            setState(() {
                              groupChatProvider.addNew(ChatData(
                                  name: 'Iron Man',
                                  profile:
                                      'https://www.screengeek.net/wp-content/uploads/2019/08/avengers-endgame-iron-man.jpg',
                                  time: DateTime.now().toString(),
                                  content: _editingController.text,
                                  online: true,
                                  own: true));
                              _editingController.text = '';
                            });
                            // Timer(
                            //     Duration(milliseconds: 300),
                            //     () => _scrollController.jumpTo(
                            //         _scrollController.position.maxScrollExtent));
                          }
                        })
                  ],
                )
              ],
            ),
            _max
                ? Positioned(
                    right: 16,
                    bottom: 60,
                    child: GestureDetector(
                      onTap: () {
                        Timer(
                            Duration(milliseconds: 300),
                            () => _scrollController.jumpTo(
                                _scrollController.position.minScrollExtent));
                      },
                      child: CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.arrow_drop_down,
                        ),
                      ),
                    ),
                  )
                : Container()
          ]),
        ),
      ),
    );
  }

  Widget _chatContent({ChatData data, ToDoListProvider toDoListProvider}) {
    String dateMsg = UtilFun.dateFormatUntil(data.time);

    return data.own
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                UtilWidget.popUpMenuChat(
                    context: context,
                    widget: Container(
                      margin: EdgeInsets.only(left: 8),
                      constraints: BoxConstraints(
                        minWidth: 0.0,
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ),
                      child: Text(
                        data.content,
                        softWrap: true,
                        textAlign: TextAlign.start,
                        style: UtilStyle.whiteText,
                      ),
                    ),
                    data: data,
                    toDoListProvider: toDoListProvider
                ),
                Text(
                  dateMsg,
                  style: UtilStyle.greyText12,
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                        radius: 20, backgroundImage: NetworkImage(data.profile)),
                    data.online? Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ) : Container(),
                  ],
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UtilWidget.popUpMenuChat(
                        context: context,
                        widget: Container(
                          margin: EdgeInsets.only(right: 8),
                          constraints: BoxConstraints(
                            minWidth: 0.0,
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xffDADADA),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: UtilStyle.normalText.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal),
                              ),
                              Text(
                                data.content,
                                softWrap: true,
                                textAlign: TextAlign.start,
                                style: UtilStyle.normalText,
                              ),
                            ],
                          ),
                        ),
                        data: data,
                      toDoListProvider: toDoListProvider
                    ),
                    Text(dateMsg, style: UtilStyle.greyText12)
                  ],
                ),
              ],
            ),
          );
  }
}
