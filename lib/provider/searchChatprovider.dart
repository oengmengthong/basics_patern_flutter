import 'package:flutter/cupertino.dart';
import 'package:mchat_app/model/chatLists.dart';

class SearchChatProvider with ChangeNotifier{

  List<ChatList> _dataChatList = [
    ChatList(
        name: 'MGroup',
        profile:
        'https://avatarfiles.alphacoders.com/192/192870.jpg',
        profile2: 'https://www.screengeek.net/wp-content/uploads/2019/08/avengers-endgame-iron-man.jpg',
        recent: 'Hi, All Developer!',
        date: '11 Aug 2020 1:30 PM',
        group: true,
        seen: false
    ),
    ChatList(
        name: 'Deadpool',
        profile:
        'https://pa1.narvii.com/6907/76302ead684e5a467ea70998b74849d31f5e3757r1-320-320_00.gif',
        recent: 'Hi, There',
        date: '10 July 2020 1:30 PM',
        group: false,
        seen: true
    ),
    ChatList(
        name: 'Iron Man',
        profile:
        'https://www.screengeek.net/wp-content/uploads/2019/08/avengers-endgame-iron-man.jpg',
        recent: 'Hi, I will back to earth',
        date: '10 July 2020 2:45 AM',
        group: false,
        seen: true),
    ChatList(
        name: 'Capitan Marvel',
        profile: 'https://avatarfiles.alphacoders.com/192/192870.jpg',
        recent: 'Hi, I created Marvel Team',
        date: '9 July 2020 1:30 PM',
        group: false,
        seen: true),
    ChatList(
        name: 'Spider Man',
        profile:
        'https://cdn.europosters.eu/image/1300/wall-murals/marvel-spiderman-10587-i55719.jpg',
        recent: 'Hi, I\'m Peter Parker!',
        date: '8 July 2020 4:30 PM',
        group: false,
        seen: true)
  ];


  List<ChatList> _data;

  List<ChatList> get data => _data;

  void search(String search){
    _data = _dataChatList.where((element) {
      return element.name.toLowerCase().contains(search.toLowerCase());
    }).toList();
    notifyListeners();
  }

  void reset(){
    _data = _dataChatList;
    notifyListeners();
  }

}

