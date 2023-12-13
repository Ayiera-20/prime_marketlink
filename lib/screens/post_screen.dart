
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:provider/provider.dart';

// class Post {
//   String postId;
//   String userId;
//   String userName;
//   String text;
//   DateTime timestamp;

//   Post({
//     required this.postId,
//     required this.userId,
//     required this.userName,
//     required this.text,
//     required this.timestamp,
//   });
// }

// class PostProvider extends ChangeNotifier {
//   List<Post> _posts = [];

//   List<Post> get posts => _posts;

//   void addPost(Post post) {
//     _posts.insert(0, post); // Insert at the beginning of the list for real-time updates
//     notifyListeners();
//   }
// }

// class PostScreen extends StatefulWidget {
//   const PostScreen({Key? key}) : super(key: key);

//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }

// class _PostScreenState extends State<PostScreen> {
//   late TextEditingController _postController;
//   late User _user;
//   late String _username = ''; // Initialize with an empty string

//   @override
//   void initState() {
//     super.initState();
//     _postController = TextEditingController();
//     _getUserData();
//   }

//   Future<void> _getUserData() async {
//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       DocumentSnapshot userData =
//           await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

//       setState(() {
//         _user = user;
//         _username = userData['name'] ?? ''; // Use the value from Firestore, or an empty string if not available
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => PostProvider(),
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text("What's Happening"),
//           backgroundColor: Colors.teal,
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 20),
//             ListTile(
//               contentPadding: EdgeInsets.zero,
//               leading: CircleAvatar(
//                 backgroundImage: NetworkImage(
//                   'https://upload.wikimedia.org/wikipedia/commons/4/44/Facebook_Logo.png',
//                 ),
//               ),
//               title: Text(
//                 _username.isNotEmpty ? _username : "Username Here",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               subtitle: Padding(
//                 padding: EdgeInsets.only(top: 10),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton.icon(
//                         style: OutlinedButton.styleFrom(
//                           backgroundColor: Colors.grey, // Adjust button color
//                         ),
//                         onPressed: () {
//                           // Add Friends button functionality here
//                         },
//                         icon: Icon(Icons.group),
//                         label: Row(
//                           children: [
//                             Text('Connections'),
//                             Expanded(
//                               child: Icon(
//                                 Icons.arrow_drop_down,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     Expanded(
//                       child: OutlinedButton.icon(
//                         style: OutlinedButton.styleFrom(
//                           primary: Colors.grey, // Adjust button color
//                         ),
//                         onPressed: () {
//                           // Add Album button functionality here
//                         },
//                         icon: Icon(Icons.add),
//                         label: Row(
//                           children: [
//                             Text('Album'),
//                             Expanded(
//                               child: Icon(
//                                 Icons.arrow_drop_down,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Divider(
//               thickness: 1,
//               color: Colors.grey,
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextFormField(
//                 controller: _postController,
//                 maxLines: 5,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   hintText: "What's on your mind?",
//                   hintStyle: TextStyle(fontSize: 16),
//                   contentPadding: EdgeInsets.all(10),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                 ),
//                 onPressed: () {
//                   _addPost(context);
//                 },
//                 child: Text('Post', style: TextStyle(color: Colors.white)),
//               ),
//             ),
//             Expanded(
//               child: PostListWidget(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _addPost(BuildContext context) {
//     String postText = _postController.text.trim();
//     if (postText.isNotEmpty) {
//       Post newPost = Post(
//         postId: UniqueKey().toString(),
//         userId: _user.uid,
//         userName: _username.isNotEmpty ? _username : "Username Here",
//         text: postText,
//         timestamp: DateTime.now(),
//       );

//       FirebaseFirestore.instance.collection('posts').doc(newPost.postId).set({
//         'userId': newPost.userId,
//         'userName': newPost.userName,
//         'text': newPost.text,
//         'timestamp': newPost.timestamp,
//       }).then((_) {
//         _postController.clear();
//         Provider.of<PostProvider>(context, listen: false).addPost(newPost);
//       }).catchError((error) {
//         print('Error adding post: $error');
//       });
//     }
//   }
// }

// class PostListWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PostProvider>(
//       builder: (context, postProvider, _) {
//         return ListView.builder(
//           itemCount: postProvider.posts.length,
//           itemBuilder: (context, index) {
//             Post post = postProvider.posts[index];

//             return ListTile(
//               title: Text(post.userName),
//               subtitle: Text(post.text),
//               // ... (add more post details as needed)
//             );
//           },
//         );
//       },
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: PostScreen(),
//   ));
// }

// import 'package:flutter/material.dart';
// import 'package:prime_marketlink/firebase_options.dart';
// import 'package:prime_marketlink/screens/splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
// import 'package:provider/provider.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class Post {
//   String postId;
//   String userId;
//   String userName;
//   String text;
//   File? image;
//   DateTime timestamp;

//   Post({
//     required this.postId,
//     required this.userId,
//     required this.userName,
//     required this.text,
//     this.image,
//     required this.timestamp,
//   });
// }

// class PostProvider extends ChangeNotifier {
//   List<Post> _posts = [];

//   List<Post> get posts => _posts;

//   void addPost(Post post) {
//     _posts.insert(0, post);
//     notifyListeners();
//   }

//   Future<void> fetchPosts() async {
//     try {
//       QuerySnapshot postSnapshot = await FirebaseFirestore.instance
//           .collection('posts')
//           .orderBy('timestamp', descending: true)
//           .get();

//       _posts = postSnapshot.docs.map((doc) {
//         return Post(
//           postId: doc.id,
//           userId: doc['userId'],
//           userName: doc['userName'],
//           text: doc['text'],
//           image: null, // You may load images from a storage solution like Firebase Storage.
//           timestamp: (doc['timestamp'] as Timestamp).toDate(),
//         );
//       }).toList();

//       notifyListeners();
//     } catch (error) {
//       print('Error fetching posts: $error');
//     }
//   }
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final FirebaseService firebaseService = FirebaseService();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Prime Market Link',
//       home: SplashScreen(),
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(178, 149, 229, 233)),
//         useMaterial3: true,
//       ),
//     );
//   }
// }

// class FirebaseService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> storeData(String collection, Map<String, dynamic> data) async {
//     await _firestore.collection(collection).add(data);
//   }

//   Future<List<Map<String, dynamic>>> fetchData(String collection) async {
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await _firestore.collection(collection).get();
//     return querySnapshot.docs.map((doc) => doc.data()).toList();
//   }

//   Future<void> updateData(String collection, String documentId, Map<String, dynamic> data) async {
//     await _firestore.collection(collection).doc(documentId).update(data);
//   }

//   Future<void> deleteData(String collection, String documentId) async {
//     await _firestore.collection(collection).doc(documentId).delete();
//   }
// }

// class PostScreen extends StatefulWidget {
//   const PostScreen({Key? key}) : super(key: key);

//   @override
//   State<PostScreen> createState() => _PostScreenState();
// }

// class _PostScreenState extends State<PostScreen> {
//   late TextEditingController _postController;
//   late User? _user;
//   late String _username = '';

//   @override
//   void initState() {
//     super.initState();
//     _postController = TextEditingController();
//     _getUserData();
//     Provider.of<PostProvider>(context, listen: false).fetchPosts();
//   }

//   Future<void> _getUserData() async {
//     _user = FirebaseAuth.instance.currentUser;

//     if (_user != null) {
//       DocumentSnapshot userData =
//           await FirebaseFirestore.instance.collection('users').doc(_user!.uid).get();

//       setState(() {
//         _username = userData['name'] ?? '';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("What's Happening"),
//         backgroundColor: Colors.teal,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 20),
//           ListTile(
//             contentPadding: EdgeInsets.zero,
//             leading: CircleAvatar(
//               backgroundImage: NetworkImage(
//                 'https://upload.wikimedia.org/wikipedia/commons/4/44/Facebook_Logo.png',
//               ),
//             ),
//             title: Text(
//               _username.isNotEmpty ? _username : "Username Here",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Divider(
//             thickness: 1,
//             color: Colors.grey,
//           ),
//           const SizedBox(height: 20),
//           _buildPostInput(),
//           Expanded(
//             child: PostListWidget(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPostInput() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _postController,
//               decoration: InputDecoration(
//                 hintText: 'What\'s on your mind?',
//               ),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.photo),
//             onPressed: (){}
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _addPost(context);
//             },
//             child: Text('Post'),
//           ),
//         ],
//       ),
//     );
//   }

//   // Future<void> _pickImage() async {
//   //   final picker = ImagePicker();
//   //   final pickedFile = await picker.getImage(source: ImageSource.gallery);

//   //   if (pickedFile != null) {
//   //     setState(() {
//   //       // You can use the pickedFile.path to display the image or upload it to a storage solution.
//   //       // For simplicity, we'll just display the image in the UI.
//   //       // Note: This approach only works with File images, not with NetworkImage.
//   //       _postController.text += '\n${pickedFile.path}';
//   //     });
//   //   }
//   // }

//   void _addPost(BuildContext context) {
//     String postText = _postController.text.trim();
//     if (postText.isNotEmpty && _user != null) {
//       FirebaseFirestore.instance.collection('posts').add({
//         'userId': _user!.uid,
//         'userName': _username.isNotEmpty ? _username : "Username Here",
//         'text': postText,
//         'timestamp': DateTime.now(),
//       }).then((_) {
//         _postController.clear();
//         // Optionally, you may also want to clear the image if included.
//       }).catchError((error) {
//         print('Error adding post: $error');
//       });
//     }
//   }
// }

// class PostListWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PostProvider>(
//       builder: (context, postProvider, _) {
//         return ListView.builder(
//           itemCount: postProvider.posts.length,
//           itemBuilder: (context, index) {
//             Post post = postProvider.posts[index];

//             return ListTile(
//               title: Text(post.userName),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(post.text),
//                   if (post.image != null)
//                     Image.file(
//                       post.image!,
//                       width: 100,
//                       height: 100,
//                     ),
//                   Text(
//                     'Posted at: ${post.timestamp}',
//                     style: TextStyle(fontSize: 12, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => PostProvider()),
//       ],
//       child: MaterialApp(
//         home: PostScreen(),
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
import 'package:prime_marketlink/firebase_options.dart';
import 'package:prime_marketlink/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:prime_marketlink/screens/connect_users.dart';

class Post {
  String postId;
  String userId;
  String userName;
  String text;
  File? image;
  DateTime timestamp;

  Post({
    required this.postId,
    required this.userId,
    required this.userName,
    required this.text,
    this.image,
    required this.timestamp,
  });
}

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  void addPost(Post post) {
    _posts.insert(0, post);
    notifyListeners();
  }

  void listenToPostsRealTime() {
    FirebaseFirestore.instance
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((QuerySnapshot postSnapshot) {
      _posts = postSnapshot.docs.map((doc) {
        return Post(
          postId: doc.id,
          userId: doc['userId'],
          userName: doc['userName'],
          text: doc['text'],
          timestamp: (doc['timestamp'] as Timestamp).toDate(),
        );
      }).toList();

      notifyListeners();
    });
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prime Market Link',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(178, 149, 229, 233)),
        useMaterial3: true,
      ),
    );
  }
}

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeData(String collection, Map<String, dynamic> data) async {
    await _firestore.collection(collection).add(data);
  }

  Future<List<Map<String, dynamic>>> fetchData(String collection) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection(collection).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> updateData(String collection, String documentId, Map<String, dynamic> data) async {
    await _firestore.collection(collection).doc(documentId).update(data);
  }

  Future<void> deleteData(String collection, String documentId) async {
    await _firestore.collection(collection).doc(documentId).delete();
  }
}

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);
  

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late TextEditingController _postController;
  late User? _user;
  late String _username = '';

  @override
  void initState() {
    super.initState();
    _postController = TextEditingController();
    _getUserData();
    Provider.of<PostProvider>(context, listen: false).listenToPostsRealTime();
  }

  Future<void> _getUserData() async {
    _user = FirebaseAuth.instance.currentUser;

    if (_user != null) {
      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection('users').doc(_user!.uid).get();

      setState(() {
        _username = userData['name'] ?? '';
      });
    }
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
        centerTitle: true,
        title: const Text("What's Happening", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://upload.wikimedia.org/wikipedia/commons/4/44/Facebook_Logo.png',
              ),
            ),
            title: Text(
              _username.isNotEmpty ? _username : "Username Here",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          _buildPostInput(),
          Expanded(
            child: PostListWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildPostInput() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _postController,
              decoration: InputDecoration(
                hintText: 'What\'s on your mind?',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: _pickImage,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,),
            onPressed: () {
              _addPost(context);
            },
            child: Text('Post', style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    setState(() {
      _postController.text += '\n${pickedFile.path}';
    });
  }
}


  void _addPost(BuildContext context) {
    String postText = _postController.text.trim();
    if (postText.isNotEmpty && _user != null) {
      FirebaseFirestore.instance.collection('posts').add({
        'userId': _user!.uid,
        'userName': _username.isNotEmpty ? _username : "Username Here",
        'text': postText,
        'timestamp': DateTime.now(),
      }).then((_) {
        _postController.clear();
      }).catchError((error) {
        print('Error adding post: $error');
      });
    }
  }
}

class PostListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, postProvider, _) {
        return ListView.builder(
          itemCount: postProvider.posts.length,
          itemBuilder: (context, index) {
            Post post = postProvider.posts[index];

            return ListTile(
              title: Text(post.userName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.text),
                  Text(
                    'Posted at: ${post.timestamp}',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostProvider()),
      ],
      child: MaterialApp(
        home: PostScreen(),
      ),
    ),
  );
}






