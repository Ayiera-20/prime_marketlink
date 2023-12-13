import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:prime_marketlink/screens/home_screen.dart';
import 'package:prime_marketlink/screens/profile.dart';
import 'package:prime_marketlink/screens/subscription.dart';
import 'package:prime_marketlink/services/messaging_service.dart';
import 'package:prime_marketlink/screens/connect_users.dart';
import 'package:prime_marketlink/screens/post_screen.dart';


class MyBottomNavigationBar extends StatelessWidget {
  final User user;
  final Function(int) onTabSelected;
  final UserProfile userProfile; // Add this line

  MyBottomNavigationBar({
    required this.user,
    required this.onTabSelected,
    required this.userProfile, // Add this line
  });

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
  data: Theme.of(context).copyWith(
    canvasColor: Color.fromARGB(255, 217, 217, 217),
    primaryColor: Colors.white,
    bottomNavigationBarTheme: Theme.of(context).bottomNavigationBarTheme.copyWith(
      selectedLabelStyle: TextStyle(color: Colors.teal),
      unselectedLabelStyle: TextStyle(color: Colors.black),
    ),
      
      ),
      child: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.connect_without_contact),
        label: 'Connect',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.whatshot),
        label: 'What\'s Happening',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.message),
        label: 'Messages',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  userName: 'yourUserName',
                  userEmail: 'yourUserEmail',
                ),
              ),
            );
            } else if (index == 1) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileListPage(),
              ));
          } else if (index == 2) {
             Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostScreen()
              ));
          } else if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChatScreen(),
            ));
          } else if (index == 4) {
             Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Profile(userProfile: userProfile)
            ));
          }
        },
      ),
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
