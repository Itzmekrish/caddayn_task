import 'dart:io';
import 'package:flutter/material.dart';
import 'package:task4/models/chat_model.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final bool isMe = message.isMe;

    return Column(
      crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (message.senderName != null && !isMe)
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            child: Text(message.senderName!,
                style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ),

        if (message.imagePath != null) Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(
              File(message.imagePath!),
              width: 200,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ) else Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: isMe ? const Color(0xFF007AFF) : const Color(0xFFF8F9FE),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: Radius.circular(isMe ? 16 : 4),
              bottomRight: Radius.circular(isMe ? 4 : 16),
            ),
          ),
          child: Text(
            message.text ,
            style: TextStyle(
              color: isMe ? Colors.white : Colors.black87,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}