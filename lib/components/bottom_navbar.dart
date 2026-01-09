import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prime_marketlink/screens/home_screen.dart';
import 'package:prime_marketlink/screens/profile.dart';
import 'package:prime_marketlink/services/messaging_service.dart';
import 'package:prime_marketlink/screens/connect_users.dart';
import 'package:prime_marketlink/screens/post_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final User user;
  final Function(int) onTabSelected;
  final UserProfile userProfile;
  final int currentIndex;

  const MyBottomNavigationBar({
    super.key,
    required this.user,
    required this.onTabSelected,
    required this.userProfile,
    this.currentIndex = 0,
  });

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey[600],
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: _currentIndex,
          elevation: 0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.connect_without_contact_outlined),
              activeIcon: Icon(Icons.connect_without_contact),
              label: 'Connect',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.whatshot_outlined),
              activeIcon: Icon(Icons.whatshot),
              label: 'Happening',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              activeIcon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            if (_currentIndex != index) {
              setState(() {
                _currentIndex = index;
              });
              widget.onTabSelected(index);
              _navigateToPage(context, index);
            }
          },
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const HomeScreen(
          userName: 'yourUserName',
          userEmail: 'yourUserEmail',
        );
        break;
      case 1:
        page = const ProfileListPage();
        break;
      case 2:
        page = const PostScreen();
        break;
      case 3:
        page = const ChatScreen();
        break;
      case 4:
        page = Profile(userProfile: widget.userProfile);
        break;
      default:
        return;
    }

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:prime_marketlink/screens/home_screen.dart';
// import 'package:prime_marketlink/screens/profile.dart';
// import 'package:prime_marketlink/screens/subscription.dart';
// import 'package:prime_marketlink/services/messaging_service.dart';
// import 'package:prime_marketlink/screens/connect_users.dart';
// import 'package:prime_marketlink/screens/post_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MyBottomNavigationBar extends StatefulWidget {
//   final User user;
//   final Function(int) onTabSelected;
//   final UserProfile userProfile;

//   MyBottomNavigationBar({
//     required this.user,
//     required this.onTabSelected,
//     required this.userProfile,
//   });

//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }
// // class UserProfile {
// //   final String uid;
// //   final String displayName;

// //   UserProfile({required this.uid, required this.displayName});

// //   factory UserProfile.fromDocument(DocumentSnapshot doc) {
// //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
// //     return UserProfile(
// //       uid: doc.id,
// //       displayName: data['displayName'] ?? '',
// //     );
// //   }
// // }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         canvasColor: Color.fromARGB(255, 217, 217, 217),
//         primaryColor: Colors.white,
//         bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme.copyWith(
//           selectedLabelStyle: TextStyle(color: Colors.teal),
//           unselectedLabelStyle: TextStyle(color: Colors.black),
//         ),
//       ),
//       child: BottomNavigationBar(
//         selectedItemColor: Colors.teal,
//         unselectedItemColor: Colors.black,
//         currentIndex: _currentIndex,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.connect_without_contact),
//             label: 'Connect',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.whatshot),
//             label: 'What\'s Happening',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             label: 'Messages',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });

//           if (widget.onTabSelected != null) {
//             widget.onTabSelected(_currentIndex);
//           }

//           if (index == 0) {
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => HomeScreen(
//                   userName: 'yourUserName',
//                   userEmail: 'yourUserEmail',
//                 ),
//               ),
//             );
//           } else if (index == 1) {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => ProfileListPage(),
//             ));
//           } else if (index == 2) {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => PostScreen(),
//             ));
//           } else if (index == 3) {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => ChatScreen(),
//             ));
//           } else if (index == 4) {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => Profile(userProfile: widget.userProfile),
//             ));
//           }
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:prime_marketlink/screens/home_screen.dart';
// import 'package:prime_marketlink/screens/profile.dart';
// import 'package:prime_marketlink/screens/subscription.dart';
// import 'package:prime_marketlink/services/messaging_service.dart';
// import 'package:prime_marketlink/screens/connect_users.dart';
// import 'package:prime_marketlink/screens/post_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class MyBottomNavigationBar extends StatefulWidget {
//   final User user;
//   final Function(int) onTabSelected;
//   final UserProfile userProfile;

//   MyBottomNavigationBar({
//     required this.user,
//     required this.onTabSelected,
//     required this.userProfile,
//   });

//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         canvasColor: Color.fromARGB(255, 217, 217, 217),
//         primaryColor: Colors.white,
//         bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme.copyWith(
//           selectedLabelStyle: TextStyle(color: Colors.teal),
//           unselectedLabelStyle: TextStyle(color: Colors.black),
//         ),
//       ),
//       child: BottomNavigationBar(
//         selectedItemColor: Colors.teal,
//         unselectedItemColor: Colors.black,
//         currentIndex: _currentIndex,
//         items: [
//          BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',  // Set the label directly without conditional check
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.connect_without_contact),
//             label: 'Connect',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.whatshot),
//             label: 'What\'s Happening',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             label: 'Messages',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         onTap: (index) {
//   if (_currentIndex != index) {
//     // Only navigate if the selected index is different
//     setState(() {
//       _currentIndex = index;
//     });

//     if (widget.onTabSelected != null) {
//       widget.onTabSelected(_currentIndex);
//     }

//     if (index == 0) {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => HomeScreen(
//             userName: 'yourUserName',
//             userEmail: 'yourUserEmail',
//             currentIndex: _currentIndex,
//           ),
//         ),
//       );
//     } else if (index == 1) {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => ProfileListPage(currentIndex: _currentIndex),
//       ));
//     } else if (index == 2) {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => PostScreen(currentIndex: _currentIndex),
//       ));
//     } else if (index == 3) {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => ChatScreen(currentIndex: _currentIndex),
//       ));
//     } else if (index == 4) {
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => Profile(userProfile: widget.userProfile, currentIndex: _currentIndex),
//       ));
//           }
//         }
//         }
//       ),
//     );
//   }
// }
