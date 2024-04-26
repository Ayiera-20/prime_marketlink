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
    Message(isMe: true, text: 'Hello!', time: DateTime.now().subtract(const Duration(minutes: 5))),
    Message(isMe: false, text: 'Hi there!', time: DateTime.now().subtract(const Duration(minutes: 3))),
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
      bottomNavigationBar: MyBottomNavigationBar(
  user: FirebaseAuth.instance.currentUser!,
  onTabSelected: (index) {
    // Handle tab selection if needed
  },
  userProfile: UserProfile(
    uid: FirebaseAuth.instance.currentUser!.uid,
    displayName: FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
  ),
),
      appBar: AppBar(
        title: const Text('Messaging App', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return MessageWidget(message: _messages[index]);
                },
              ),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () {
              // Implement image picking logic
            },
          ),
        ],
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
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: message.isMe ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  message.isMe ? 'You' : 'Sender Name',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _formatTimestamp(message.time),
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            if (message.imageUrl != null)
              Image.network(
                message.imageUrl!,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              )
            else
              Text(
                message.text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _formatTimestamp(DateTime time) {
    return '${time.hour}:${time.minute}';
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
    await _firebaseMessaging.subscribeToTopic('all');
  }

  void handleMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
    });
  }
}