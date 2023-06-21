import 'dart:async';

import 'package:mod_master_2023/ui/chatbot/interface/message.dart';

import '../../../models/bleModel.dart';

class MyStream {
  BluetoothModel bluetoothS = BluetoothModel(bluetoothDevice: null);

  List<MessageModel> listMessageChatbot = [
    new MessageModel(type: TypeMessage.bot, text: "Xin chào bạn"),
    new MessageModel(type: TypeMessage.bot, text: "Bạn cần giúp đỡ gì không?"),
  ];

  StreamController<BluetoothModel> BLEController =
      new StreamController<BluetoothModel>.broadcast();

  StreamController<List<MessageModel>> chatbotMessageListController =
      new StreamController<List<MessageModel>>.broadcast();

  Stream<BluetoothModel> get userStream => BLEController.stream;
  Stream<List<MessageModel>> get chatbotMessage =>
      chatbotMessageListController.stream;

  void setBle(BluetoothModel deviceBle) {
    BLEController.sink.add(deviceBle);
  }

  void clearBle() {
    BLEController.sink.add(BluetoothModel(bluetoothDevice: null));
  }

  void setChatbotList(List<MessageModel> chatbotList) {
    chatbotMessageListController.sink.add(chatbotList);
  }

  void dispose() {
    BLEController.close();
    chatbotMessageListController.close();
  }
}
