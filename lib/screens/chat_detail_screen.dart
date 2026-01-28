import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task4/widgets/custom_app_bar.dart';
import 'package:task4/widgets/chat_bubble.dart';
import 'package:task4/models/chat_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task4/constants/app_colors.dart';

class ChatDetailScreen extends StatefulWidget {
  final ChatUser user;
  final Function(String) onMessageSent;

  const ChatDetailScreen({
    super.key,
    required this.user,
    required this.onMessageSent,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        widget.user.messages.add(
          Message(text: "", imagePath: image.path, isMe: true),
        );
      });
      widget.onMessageSent("Sent an image");
      _scrollToBottom();
    }
  }

  void _handleSend() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        widget.user.messages.add(
          Message(text: text, isMe: true),
        );
      });

      widget.onMessageSent(text);
      _scrollToBottom();
      _messageController.clear();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.extentTotal,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CustomAppBar(
                title: widget.user.name,
                leftIcon: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: GestureDetector(
                    child: SvgPicture.asset('assets/icons/back.svg'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                rightIcon: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SvgPicture.asset(widget.user.profileSvg, height: 35),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: widget.user.messages.length,
                itemBuilder: (context, index) {
                  final msg = widget.user.messages[index];
                  return ChatBubble(
                    message: msg,
                  );
                },
              ),
            ),
            // Updated Message Input Field logic
            _buildInputArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: Row(
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: const Icon(Icons.add, color: Colors.blue, size: 30),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _messageController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintText: "Type a message...",
                hintStyle: const TextStyle(color: AppColors.hint),
                filled: true,
                fillColor: const Color(0xFFF8F9FE),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: _isFocused
                    ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: _handleSend,
                    child: SvgPicture.asset(
                      'assets/icons/send.svg',
                    ),
                  ),
                )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
