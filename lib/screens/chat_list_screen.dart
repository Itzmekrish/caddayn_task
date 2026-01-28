import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task4/constants/app_colors.dart';
import 'package:task4/widgets/custom_app_bar.dart';
import 'package:task4/screens/chat_detail_screen.dart';
import 'package:task4/models/chat_model.dart';
import 'package:task4/constants/chat_user.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomAppBar(
              title: "Chats",
              leftIcon: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: GestureDetector(
                  onTap: () {
                    print("Edit clicked");
                  },
                  child: const Text("Edit",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary)),
                ),
              ),
              rightIcon: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset('assets/icons/edit.svg'),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 44,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Color(0xFF8F9098),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: SvgPicture.asset('assets/icons/search.svg')
                    ),
                    fillColor: Color(0xFFF8F9FE),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: chatData.length,
            itemBuilder: (context, index) {
              final user = chatData[index];
              return ChatItem(
                name: user.name,
                count: user.unreadCount,
                message: user.lastMessage,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailScreen(
                        user: user,
                        onMessageSent: (newText) {
                          setState(() {
                            chatData[index] = ChatUser(
                              name: user.name,
                              lastMessage: newText,
                              profileSvg: user.profileSvg,
                              unreadCount: user.unreadCount,
                              messages: user.messages,
                            );
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ))
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 88,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/chats.svg',
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/chat.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/friends.svg',
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/friends.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              label: "Friends",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/settings.svg',
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/settings.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final int? count;
  final VoidCallback onTap;

  const ChatItem(
      {super.key,
      required this.name,
      required this.message,
      this.count,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: SizedBox(
        width: 50,
        child: SvgPicture.asset(
          'assets/icons/profile.svg',
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
      ),
      subtitle: Text(
        message,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.grey[500], fontSize: 12, fontWeight: FontWeight.w400),
      ),
      trailing: count != null ? _buildBadge(count!) : null,
    );
  }

  Widget _buildBadge(int count) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:
          const BoxDecoration(color: Color(0xFF2196F3), shape: BoxShape.circle),
      child: Text(
        '$count',
        style: const TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }
}
