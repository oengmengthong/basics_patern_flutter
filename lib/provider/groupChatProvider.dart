import 'package:flutter/cupertino.dart';
import 'package:mchat_app/model/chatData.dart';

class GroupChatProvider with ChangeNotifier{
  List<ChatData> _data = [
    ChatData(
        name: 'Capitan America',
        profile:
        'https://i.pinimg.com/originals/a7/66/23/a766239b6cb56d84e20b1e26d7ff5efe.jpg',
        time: '2020-08-28T10:35:26.000000Z',
        content: 'Hi, Let\'s Go!',
        online: true,
        own: true),
    ChatData(
        name: 'Spider Man',
        profile:
        'https://cdn.europosters.eu/image/1300/wall-murals/marvel-spiderman-10587-i55719.jpg',
        time: '2020-08-28T10:20:35.000000Z',
        content: 'Please, I\'m not young!',
        online: true,
        own: false),
    ChatData(
        name: 'Spider Man',
        profile:
        'https://cdn.europosters.eu/image/1300/wall-murals/marvel-spiderman-10587-i55719.jpg',
        time: '2020-08-28T10:20:35.000000Z',
        content: 'Hi, I want to join too. pls!',
        online: true,
        own: false),
    ChatData(
        name: 'Iron Man',
        profile:
        'https://www.screengeek.net/wp-content/uploads/2019/08/avengers-endgame-iron-man.jpg',
        time: '2020-08-28T10:15:28.000000Z',
        content: 'Hi, Capitan!',
        online: false,
        own: false),
    ChatData(
        name: 'Capitan Marvel',
        profile: 'https://avatarfiles.alphacoders.com/192/192870.jpg',
        time: '2020-08-28T10:11:24.000000Z',
        content: 'Hi, All!',
        online: true,
        own: false),
    ChatData(
        name: 'Capitan Marvel',
        profile: 'https://avatarfiles.alphacoders.com/192/192870.jpg',
        time: '2020-08-28T10:10:24.000000Z',
        content: 'Hi, All!',
        online: true,
        own: false),
  ];

  List<ChatData> get data => _data;

  void addNew(ChatData data){
    _data.insert(0, data);
    notifyListeners();
  }
}