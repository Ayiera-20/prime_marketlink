// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'User Search and Discovery',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: UserSearchScreen(),
//     );
//   }
// }




// class UserSearchScreen extends StatefulWidget {
//   @override
//   _UserSearchScreenState createState() => _UserSearchScreenState();
// }

// class _UserSearchScreenState extends State<UserSearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   List<UserProfile> _searchResults = [];

//   void _searchUsers(String query) {
//     // Use Firebase Firestore to search for users based on the query
//     // In a real-world scenario, you would perform a more advanced search
//     // For simplicity, this example assumes users have a 'displayName' field

//     FirebaseFirestore.instance
//         .collection('userProfiles')
//         .where('displayName', isGreaterThanOrEqualTo: query)
//         .where('displayName', isLessThanOrEqualTo: query + '\uf8ff')
//         .get()
//         .then((querySnapshot) {
//       setState(() {
//         _searchResults = querySnapshot.docs
//             .map((doc) => UserProfile.fromDocument(doc))
//             .toList();
//       });
//     });
//   }

  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: _searchController,
//           decoration: InputDecoration(
//             hintText: 'Search for users...',
//           ),
//           onChanged: (query) {
//             _searchUsers(query);
//           },
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: _searchResults.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(_searchResults[index].displayName),
//             // You can customize this to show more user information
//             onTap: () {
//               // Handle user selection (e.g., navigate to user profile)
//               print('Selected user: ${_searchResults[index].displayName}');
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// class UserProfile {
//   final String uid;
//   final String displayName;

//   UserProfile({required this.uid, required this.displayName});

//   factory UserProfile.fromDocument(DocumentSnapshot doc) {
//     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//     return UserProfile(
//       uid: doc.id,
//       displayName: data['displayName'] ?? '',
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
import 'package:prime_marketlink/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProfile {
  final String uid;
  final String displayName;

  UserProfile({required this.uid, required this.displayName});

  factory UserProfile.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserProfile(
      uid: doc.id,
      displayName: data['displayName'] ?? '',
    );
  }
}

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<UserProfile>> getUserProfiles() async {
    QuerySnapshot querySnapshot = await _firestore.collection('users').get();

    return querySnapshot.docs
        .map((doc) => UserProfile.fromDocument(doc))
        .toList();
  }

  Future<List<UserProfile>> searchUsers(String query) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('users')
        .where('displayName', isGreaterThanOrEqualTo: query)
        .where('displayName', isLessThanOrEqualTo: '$query\uf8ff')
        .get();

    return querySnapshot.docs
        .map((doc) => UserProfile.fromDocument(doc))
        .toList();
  }
}

class ProfileListPage extends StatefulWidget {
  const ProfileListPage({super.key});

   

  @override
  _ProfileListPageState createState() => _ProfileListPageState();
}

class _ProfileListPageState extends State<ProfileListPage> {
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _searchController = TextEditingController();
  List<UserProfile> _profiles = [];

  @override
  void initState() {
    super.initState();
    _loadProfiles();
  }

  void _loadProfiles() async {
    List<UserProfile> profiles = await _firebaseService.getUserProfiles();
    setState(() {
      _profiles = profiles;
    });
  }

  void _searchUsers(String query) async {
    if (query.isEmpty) {
      _loadProfiles(); 
    } else {
      List<UserProfile> searchResults = await _firebaseService.searchUsers(query);
      setState(() {
        _profiles = searchResults;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(
  user: FirebaseAuth.instance.currentUser!,
  onTabSelected: (index) {
  },
  userProfile: UserProfile(
    uid: FirebaseAuth.instance.currentUser!.uid,
    displayName: FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
  ),
),
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search for users...',
          ),
          onChanged: (query) {
            _searchUsers(query);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _profiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_profiles[index].displayName),
            onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile(userProfile: _profiles[index])),
            );
          },

          );
        },
      ),
    );
  }
}
