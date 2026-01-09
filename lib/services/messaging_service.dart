// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';



// class AuthenticationWrapper extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: _auth.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.active) {
//           User? user = snapshot.data as User?;
//           if (user == null) {
//             // Redirect to your main login screen or perform necessary actions
//             return Login();
//           } else {
//             return ChatScreen(user: user);
//           }
//         }
//         return Scaffold(
//           body: Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       },
//     );
//   }
// }

// class ChatScreen extends StatefulWidget {
//   final User user;

//   ChatScreen({required this.user});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController _messageController = TextEditingController();
//   final MessagingService _messagingService = MessagingService();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   void initState() {
//     super.initState();
//     _messagingService.initFCM();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Messaging App'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.exit_to_app),
//             onPressed: () {
//               FirebaseAuth.instance.signOut();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot>(
//               stream: _firestore.collection('messages').snapshots(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 var messages = snapshot.data!.docs.reversed;
//                 List<MessageWidget> messageWidgets = [];
//                 for (var message in messages) {
//                   var messageData = message.data() as Map<String, dynamic>;
//                   var messageText = messageData['text'];
//                   var messageSender = messageData['userId'];

//                   var messageWidget = MessageWidget(
//                     message: Message(
//                       isMe: messageSender == widget.user.uid,
//                       text: messageText,
//                       time: DateTime.now(),
//                     ),
//                   );
//                   messageWidgets.add(messageWidget);
//                 }
//                 return ListView(
//                   reverse: true,
//                   children: messageWidgets,
//                 );
//               },
//             ),
//           ),
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageInput() {
//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _messageController,
//               decoration: InputDecoration(
//                 hintText: 'Type your message...',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               _sendMessage();
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.image),
//             onPressed: () {
//               // Implement image picking logic
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _sendMessage() {
//     String text = _messageController.text.trim();
//     if (text.isNotEmpty) {
//       _firestore.collection('messages').add({
//         'userId': widget.user.uid,
//         'text': text,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//       _messageController.clear();
//     }
//   }
// }

// class MessageWidget extends StatelessWidget {
//   final Message message;

//   const MessageWidget({Key? key, required this.message}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//         padding: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           color: message.isMe ? Colors.blue : Colors.grey,
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   message.isMe ? 'You' : 'Sender Name',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 Text(
//                   _formatTimestamp(message.time),
//                   style: TextStyle(
//                     fontSize: 12.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 4.0),
//             Text(
//               message.text,
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _formatTimestamp(DateTime time) {
//     return '${time.hour}:${time.minute}';
//   }
// }

// class Message {
//   final bool isMe;
//   final String text;
//   final DateTime time;

//   Message({required this.isMe, required this.text, required this.time});
// }

// class MessagingService {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initFCM() async {
//     await _firebaseMessaging.subscribeToTopic('all');
//   }
// }

// // YourMainLoginScreen: Replace this with your existing login screen widget.
// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Implement your existing login screen UI here
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Center(
//         child: Text('Your existing login screen'),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:prime_marketlink/screens/connect_users.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messaging App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AuthenticationWrapper(),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var user = snapshot.data;
          if (user == null) {
            return  SignInScreen();
          } else {
            return const ChatScreen();
          }
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class SignInScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

   SignInScreen({super.key});

  Future<void> _signInAnonymously() async {
    try {
      await _auth.signInAnonymously();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _signInAnonymously,
          child: const Text('Sign In Anonymously'),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [
    Message(isMe: true, text: 'Hello! How can I help you today?', time: DateTime.now().subtract(const Duration(minutes: 5))),
    Message(isMe: false, text: 'Hi there! I have a question about market expansion.', time: DateTime.now().subtract(const Duration(minutes: 3))),
    Message(isMe: true, text: 'Sure, I\'d be happy to help!', time: DateTime.now().subtract(const Duration(minutes: 2))),
  ];

  final MessagingService _messagingService = MessagingService();

  @override
  void initState() {
    super.initState();
    _messagingService.initFCM();
    _messagingService.handleMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      bottomNavigationBar: MyBottomNavigationBar(
        user: FirebaseAuth.instance.currentUser!,
        onTabSelected: (index) {},
        userProfile: UserProfile(
          uid: FirebaseAuth.instance.currentUser!.uid,
          displayName: FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
        ),
        currentIndex: 3,
      ),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Colors.teal,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Messages',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final showDate = index == _messages.length - 1 ||
                    _messages[index].time.day != _messages[index + 1].time.day;
                return Column(
                  children: [
                    if (showDate) _buildDateDivider(_messages[index].time),
                    MessageWidget(message: _messages[index]),
                  ],
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildDateDivider(DateTime date) {
    final today = DateTime.now();
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    String dateText;
    
    if (date.year == today.year && date.month == today.month && date.day == today.day) {
      dateText = 'Today';
    } else if (date.year == yesterday.year && date.month == yesterday.month && date.day == yesterday.day) {
      dateText = 'Yesterday';
    } else {
      dateText = '${date.day}/${date.month}/${date.year}';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(child: Divider(color: Colors.grey[300])),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              dateText,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Divider(color: Colors.grey[300])),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.teal),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                  maxLines: null,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                onPressed: () {
                  _sendMessage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    String text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.insert(0, Message(isMe: true, text: text, time: DateTime.now()));
      });
      _messageController.clear();
    }
  }
}

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message.isMe) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 18, color: Colors.grey[600]),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: message.isMe ? Colors.teal : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: Radius.circular(message.isMe ? 20 : 4),
                  bottomRight: Radius.circular(message.isMe ? 4 : 20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message.imageUrl != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        message.imageUrl!,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    Text(
                      message.text,
                      style: TextStyle(
                        color: message.isMe ? Colors.white : Colors.black87,
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                  const SizedBox(height: 4),
                  Text(
                    _formatTimestamp(message.time),
                    style: TextStyle(
                      fontSize: 11,
                      color: message.isMe ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (message.isMe) ...[
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.teal[100],
              child: Icon(Icons.person, size: 18, color: Colors.teal),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTimestamp(DateTime time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}

class Message {
  final bool isMe;
  final String text;
  final DateTime time;
  final String? imageUrl;

  Message({required this.isMe, required this.text, required this.time, this.imageUrl});
}

class MessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initFCM() async {
    try {
      // Request permission for notifications
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission');
        
        // For iOS, wait for APNS token before subscribing
        String? apnsToken = await _firebaseMessaging.getAPNSToken();
        if (apnsToken != null) {
          print('APNS Token available: $apnsToken');
          await _firebaseMessaging.subscribeToTopic('all');
          print('Subscribed to topic: all');
        } else {
          print('APNS Token not available yet, skipping topic subscription');
          // You can retry later or handle this case differently
        }
      } else {
        print('User declined or has not accepted permission');
      }
    } catch (e) {
      print('Error initializing FCM: $e');
      // Don't throw the error, just log it to prevent app crashes
    }
  }

  void handleMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
    });
  }
}