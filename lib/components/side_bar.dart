
import 'package:flutter/material.dart';
import 'package:prime_marketlink/screens/login.dart';
import 'package:prime_marketlink/screens/signup.dart';

// ignore: must_be_immutable
class Sidebar extends StatelessWidget {

  final int _currentIndex = 0;

  const Sidebar({super.key});

  
  @override
   Widget build(BuildContext context) {
     return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(    
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(    
        margin: EdgeInsets.all(0),  
        padding: EdgeInsets.only(bottom: 0.5, top: 60 ),
        decoration: BoxDecoration(
         color: Colors.black,
        ),

        child: Text('Start your journey with us!', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic), textAlign: TextAlign.center, ),
      ),
      ListTile(
        title: const Text('Sign up'),
        tileColor: Colors.white,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Signup(),
                ));
        },
      ),
      ListTile(
        title: const Text('Log in'),
        tileColor: Colors.white,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Login(),
                ));
        },
      ),
      ListTile(
  title: const Text('close window'),
  tileColor: Colors.white,
  onTap: () {
    
    Navigator.pop(context);
  },
),
    ],
  ),
      ), 
     );
   }
}