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
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prime Market Link',
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(178, 149, 229, 233)),
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

  Future<void> updateData(
      String collection, String documentId, Map<String, dynamic> data) async {
    await _firestore.collection(collection).doc(documentId).update(data);
  }

  Future<void> deleteData(String collection, String documentId) async {
    await _firestore.collection(collection).doc(documentId).delete();
  }
}

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

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
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.uid)
          .get();

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
        currentIndex: 2,
        onTabSelected: (index) {},
        userProfile: UserProfile(
          uid: FirebaseAuth.instance.currentUser!.uid,
          displayName:
              FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "What's Happening",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.business_center_rounded,
                    size: 32,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _username.isNotEmpty ? _username : "Username",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Share your business updates",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildPostInput(),
          const Expanded(
            child: PostListWidget(),
          ),
        ],
      ),
    );
  }

  Widget _buildPostInput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _postController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Share your thoughts, updates, or opportunities...',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.teal, width: 2),
              ),
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.photo_library_outlined, size: 20),
                label: const Text('Photo'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey[700],
                  side: BorderSide(color: Colors.grey[300]!),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _addPost(context);
                },
                icon: const Icon(Icons.send, size: 18),
                label: const Text('Post'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
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
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, postProvider, _) {
        if (postProvider.posts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.forum_outlined,
                  size: 80,
                  color: Colors.grey[300],
                ),
                const SizedBox(height: 16),
                Text(
                  'No posts yet',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Be the first to share something!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: postProvider.posts.length,
          itemBuilder: (context, index) {
            Post post = postProvider.posts[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.business_center,
                            size: 20,
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.userName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                _formatTimestamp(post.timestamp),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      post.text,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Divider(height: 1, color: Colors.grey[200]),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.thumb_up_outlined, size: 20),
                          onPressed: () {},
                          color: Colors.grey[600],
                        ),
                        Text(
                          'Like',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13),
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.comment_outlined, size: 20),
                          onPressed: () {},
                          color: Colors.grey[600],
                        ),
                        Text(
                          'Comment',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
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
      child: const MaterialApp(
        home: PostScreen(),
      ),
    ),
  );
}
