import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prime_marketlink/screens/home_screen.dart';
import 'package:prime_marketlink/screens/login.dart';


class Signup extends StatelessWidget {
  static const mySnackBar = SnackBar(content:Text('You are now Signed up!'));
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Positioned background image to cover the whole page
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          
          Container(
            margin: const EdgeInsets.all(20.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Prime Market Link',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(    
                prefixIcon: Icon(Icons.person),            
                hintText: "Enter your Full Name",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration( 
                prefixIcon: Icon(Icons.phone),                               
                hintText: "Enter Phone Number",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration( 
                prefixIcon: Icon(Icons.email),               
                hintText: "Enter Email",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: InputDecoration(  
                prefixIcon: Icon(Icons.lock),              
                hintText: "Enter Password",
                filled: true,
                suffixIcon: Icon(Icons.remove_red_eye),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
           const SizedBox(height: 30),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                    },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF8FF2F7)),
                  textStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.black)),
                ),
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Already have an account?',
              style: TextStyle(color: Colors.white),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Login(),
                ));
              },
              child: const Text('Login Here', style: TextStyle(color:Color(0xFF8FF2F7) ),),
            ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

      