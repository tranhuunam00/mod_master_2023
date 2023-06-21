enum TypeMessage {
  owner,
  bot,
}

class MessageModel {
  late TypeMessage type;
  late String text;
  late String? time;
  late String? path;
  late String? sourceId;
  late String? targetId;
  MessageModel({
    required this.type,
    this.text = "",
    this.time = "",
    this.path = "",
    this.sourceId = "",
    this.targetId = "",
  });
}
