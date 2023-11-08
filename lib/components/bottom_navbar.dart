import 'dart:ui';

import 'package:flutter/material.dart';


class MyBottomNavigationBar extends StatelessWidget {
   int _currentIndex = 0;
 

  @override
 Widget build(BuildContext context) {
    return BottomNavigationBar(
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', 
            backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.network_cell_rounded),
            label: 'My Network', 
            backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search', 
            backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_rounded),
            label: 'Subscribe', 
            backgroundColor: Colors.black
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', 
            backgroundColor: Colors.black,
            ),   
        ],
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;

        //   });

        // },

      );
  
  }
}