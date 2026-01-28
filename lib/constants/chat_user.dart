import 'package:task4/models/chat_model.dart';

  final List<ChatUser> chatData = [
  ChatUser(
  name: "Krish",
  lastMessage: "hellooo",
  profileSvg: 'assets/icons/profile.svg',
  unreadCount: 2,
  messages: [
  Message(text: "Hey Krish, you free?", isMe: true),
  Message(text: "Yeah, what's up?", isMe: false),
  Message(text: "Want to grab coffee?", isMe: true),
  Message(text: "hellooo", isMe: false),
  ],
  ),
  ChatUser(
  name: "Yadhu",
  lastMessage: "hii",
  profileSvg: 'assets/icons/profile.svg',
  messages: [
  Message(text: "Are you coming to the match?", isMe: true),
  Message(text: "Almost there!", isMe: false),
  Message(text: "Save me a seat.", isMe: true),
  Message(text: "hii", isMe: false),
  ],
  ),
  ChatUser(
  name: "Samson",
  lastMessage: "See you then!",
  profileSvg: 'assets/icons/profile.svg',
  unreadCount: 1,
  messages: [
  Message(text: "Did you finish the task?", isMe: false),
  Message(text: "Just uploading it now.", isMe: true),
  Message(text: "Great, I'll check it.", isMe: false),
  Message(text: "See you then!", isMe: false),
  ],
  ),
  ChatUser(
  name: "Melvin",
  lastMessage: "Good morning",
  profileSvg: 'assets/icons/profile.svg',
  messages: [
  Message(text: "Did you see the news?", isMe: false),
  Message(text: "Which one?", isMe: true),
  Message(text: "The new Flutter update!", isMe: false),
  Message(text: "Good morning", isMe: false),
  ],
  ),
  ChatUser(
  name: "Athul Christo",
  lastMessage: "I will be there",
  profileSvg: 'assets/icons/profile.svg',
  messages: [
  Message(text: "Meeting at 5?", isMe: true),
  Message(text: "Make it 5:30.", isMe: false),
  Message(text: "Sure, no problem.", isMe: true),
  Message(text: "I will be there", isMe: false),
  ],
  ),
  ChatUser(
  name: "Aisha",
  lastMessage: "I'll send it now.",
  profileSvg: 'assets/icons/profile.svg',
  unreadCount: 3,
  messages: [
  Message(text: "Hey, do you have the notes?", isMe: false),
  Message(text: "Which subject?", isMe: true),
  Message(text: "Mobile Computing.", isMe: false),
  Message(text: "I'll send it now.", isMe: false),
  ],
  ),
  ChatUser(
  name: "John Doe",
  lastMessage: "Talk later!",
  profileSvg: 'assets/icons/profile.svg',
  messages: [
  Message(text: "Project deadline is tomorrow.", isMe: false),
  Message(text: "I know, I'm panicking!", isMe: true),
  Message(text: "Don't worry, we're almost done.", isMe: false),
  Message(text: "Talk later!", isMe: false),
  ],
  ),
  ChatUser(
  name: "Sarah Jenkins",
  lastMessage: "That's awesome!",
  profileSvg: 'assets/icons/profile.svg',
  messages: [
  Message(text: "I got the internship!", isMe: true),
  Message(text: "No way! Congrats!", isMe: false),
  Message(text: "I start next Monday.", isMe: true),
  Message(text: "That's awesome!", isMe: false),
  ],
  ),
  ChatUser(
  name: "Mike Ross",
  lastMessage: "I'm on it.",
  profileSvg: 'assets/icons/profile.svg',
  unreadCount: 5,
  messages: [
  Message(text: "Can you review my code?", isMe: false),
  Message(text: "Send the GitHub link.", isMe: true),
  Message(text: "Sent it to your email.", isMe: false),
  Message(text: "I'm on it.", isMe: false),
  ],
  ),
  ChatUser(
  name: "Priya Sharma",
  lastMessage: "Happy Birthday! 🎉",
  profileSvg: 'assets/icons/profile.svg',
  messages: [
  Message(text: "Hey, it's my birthday today!", isMe: false),
  Message(text: "Oh wow, have a blast!", isMe: true),
  Message(text: "Thanks a lot!", isMe: false),
  Message(text: "Happy Birthday! 🎉", isMe: false),
  ],
  ),
  ];
