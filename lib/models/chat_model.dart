class Message {
  final String text;
  final bool isMe;
  final String? senderName;
  final String? imagePath;

  Message({required this.text, required this.isMe, this.senderName,this.imagePath});
}

class ChatUser {
  final String name;
  final String lastMessage;
  final String profileSvg;
  final int? unreadCount;
  final List<Message> messages;

  ChatUser({
    required this.name,
    required this.lastMessage,
    required this.profileSvg,
    this.unreadCount,
    required this.messages,
  });
}