import 'package:flutter/material.dart';
import 'package:prime_marketlink/screens/home_screen.dart';
import 'package:prime_marketlink/screens/profile.dart';
import 'package:prime_marketlink/screens/subscription.dart';

class MyBottomNavigationBar extends StatelessWidget {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromARGB(255, 217, 217, 217),
         primaryColor: Colors.white,
        textTheme: Theme.of(context).textTheme.copyWith(
              bodySmall: TextStyle(color: Colors.grey),
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
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_sharp),
            label: 'Subscribe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
          } else if (index == 4) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Profile(),
            ));
          } else if (index == 3) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Subscription(),
            ));
          }
        },
      ),
    );
  }
}






// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:prime_marketlink/screens/home_screen.dart';
// import 'package:prime_marketlink/screens/profile.dart';
// import 'package:prime_marketlink/screens/subscription.dart';


// class MyBottomNavigationBar extends StatelessWidget {
//    int _currentIndex = 0;
 

//   @override
//  Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.amber,
//         items:  [
//            BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => HomeScreen(),
//                 ));
//               },
//               icon: Icon(Icons.home),
//             ),
//             label: 'Home',
//             backgroundColor: Colors.black,
//             ),
//              BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: () {
//                 // Navigator.of(context).push(MaterialPageRoute(
//                 //   builder: (context) => Profile(),
//                 // ));
//               },
//               icon: Icon(Icons.connect_without_contact),
//             ),
//             label: 'connect'
//             ),
//              BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: () {
//                 // Navigator.of(context).push(MaterialPageRoute(
//                 //   builder: (context) => Profile(),
//                 // ));
//               },
//               icon: Icon(Icons.search),
//             ),
//             label: 'search'
//             ),
//             BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: () {
//                  Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => Subscription(),
//                             ),
//                           );
//               },
//               icon: Icon(Icons.subscriptions_sharp),
//             ),
//             label: 'Subscribe'
//             ),
   
//            BottomNavigationBarItem(
//             icon: IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => Profile(),
//                 ));
//               },
//               icon: Icon(Icons.person),
//             ),
//             label: 'Profile'
//             ),
//         ],
//         // onTap: (index) {
//         //   setState(() {
//         //     _currentIndex = index;

//         //   });

//         // },

//       );
  
//   }
// }