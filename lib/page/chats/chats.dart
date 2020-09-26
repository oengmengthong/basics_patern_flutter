import 'package:flutter/material.dart';
import 'package:mchat_app/model/chatLists.dart';
import 'package:mchat_app/provider/searchChatprovider.dart';
import 'package:mchat_app/utils/style.dart';
import 'package:provider/provider.dart';

import 'ChatView.dart';
import 'groupChatView.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<SearchChatProvider>(context, listen: false).reset();
    });
  }

  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  TextEditingController _search = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    SearchChatProvider searchChatProvider = Provider.of<SearchChatProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Scaffold(
        key: _globalKey,
        appBar: AppBar(
          title: Text('Chats', style: UtilStyle.titleAppBarText,),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 57,
                      // margin: EdgeInsets.all(16),
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.teal.withOpacity(0.15)),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.teal.withOpacity(0.1),
                                offset: Offset(1, 1),
                                blurRadius: 8)
                          ]),
                      child: TextField(
                        controller: _search,
                        maxLines: 1,
                        onChanged: (value){
                          if(value != null || value != ''){
                            searchChatProvider.search(value);
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: UtilStyle.placeHolderText,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                    child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.search, color: Colors.white,)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              searchChatProvider.data == null ? Center(child: CircularProgressIndicator(),) : Expanded(
                child: ListView.builder(
                  itemCount: searchChatProvider.data.length,
                  itemBuilder: (context, index) {
                    return _boxChat(searchChatProvider.data[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boxChat(ChatList data) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.teal.withOpacity(0.2),
                offset: Offset(1, 3),
                blurRadius: 6)
          ]),
      child: ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    data.group ? GroupChatViewPage() : ChatViewPage())),
        leading: data.group
            ? CircleAvatar(
                radius: 30,
                backgroundColor: Colors.transparent,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.teal.withOpacity(0.3),
                        backgroundImage: NetworkImage(data.profile2),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.teal.withOpacity(0.3),
                          backgroundImage: NetworkImage(data.profile),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : CircleAvatar(
                radius: 30,
                backgroundColor: Colors.teal.withOpacity(0.3),
                backgroundImage: NetworkImage(data.profile),
              ),
        title: Text(data.name, style: UtilStyle.blackBoldText),
        subtitle: Text(data.recent, style: UtilStyle.normalText),
        trailing: data.seen
            ? null
            : CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Text('3',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
      ),
    );
  }
}
