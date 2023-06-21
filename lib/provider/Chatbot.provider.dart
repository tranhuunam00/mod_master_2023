import 'package:flutter/cupertino.dart';
import 'package:mod_master_2023/ui/chatbot/interface/message.dart';

import 'Stream/user_stream.dart';

class ChatbotProvider with ChangeNotifier {
  MyStream myStream = new MyStream();
  List<MessageModel> chatbotList = [
    new MessageModel(type: TypeMessage.bot, text: "Xin chào bạn?"),
    new MessageModel(type: TypeMessage.bot, text: "Bạn cần giúp đỡ gì không?"),
  ];

  Future addMessage(MessageModel newMessage) async {
    try {
      chatbotList.add(newMessage);
      myStream.setChatbotList(chatbotList);
    } catch (e) {}
    notifyListeners();
  }

  Future clearChatbotList() async {
    try {
      chatbotList = [
        new MessageModel(type: TypeMessage.bot, text: "Xin chào bạn?"),
        new MessageModel(
            type: TypeMessage.bot, text: "Bạn cần giúp đỡ gì không?"),
      ];
      myStream.setChatbotList(chatbotList);
    } catch (e) {}
    notifyListeners();
  }
}
