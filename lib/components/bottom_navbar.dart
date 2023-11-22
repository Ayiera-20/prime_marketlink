import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prime_marketlink/screens/home_screen.dart';
import 'package:prime_marketlink/screens/profile.dart';


class MyBottomNavigationBar extends StatelessWidget {
   int _currentIndex = 0;
 

  @override
 Widget build(BuildContext context) {
    return BottomNavigationBar(
        items:  [
           BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
              },
              icon: Icon(Icons.home),
            ),
            label: 'Home',
            backgroundColor: Colors.black,
            ),
             BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => Profile(),
                // ));
              },
              icon: Icon(Icons.connect_without_contact),
            ),
            label: 'connect'
            ),
             BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => Profile(),
                // ));
              },
              icon: Icon(Icons.search),
            ),
            label: 'search'
            ),
            BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => Profile(),
                // ));
              },
              icon: Icon(Icons.subscriptions_sharp),
            ),
            label: 'Subscribe'
            ),
   
           BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Profile(),
                ));
              },
              icon: Icon(Icons.person),
            ),
            label: 'Profile'
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