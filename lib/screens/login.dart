






// class Login extends StatelessWidget {
//   static const mySnackBar = SnackBar(content:Text('Logged in successfully!'));
//   @override
//   // List<user> users = [];
//    Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("log in"),
//         backgroundColor: Colors.white,
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Positioned.fill(
//             child: Container(
//               decoration:  BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("images/background.jpg"),
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), 
//                   BlendMode.darken)
                  
//                 ),
                
//               ),
//             ),
//           ),
          
//           Container(
//             margin: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         child: Text('AH'),
//                       ),
//                       SizedBox(width: 20,),
//                       Text(
//                         'Welcome Back!',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: Icon(Icons.person),
//                     hintText: "Enter Username",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: Icon(Icons.email),
//                     hintText: "Enter your Email",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: Icon(Icons.lock),
//                     hintText: "Enter Password",
//                     suffixIcon: Icon(Icons.remove_red_eye,),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 60),
//                 Container(
//                   margin: EdgeInsets.only(left: 10, right: 10),
//                   width: 365, 
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => HomeScreen(),
//                       ));
//                       // addUserDialog(context);
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                         Colors.teal,
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0), // Set the circular radius
//                         ),
//                       ),
//                     ),
//                     child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
//                   ),
//                 ),


                
//                 const SizedBox(height: 30),
//                 const Text(
//                   "Don't have an account?",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => Signup(),
//                     ));
//                   },
//                   child: const Text(
//                     'Sign up Here',
//                     style: TextStyle(color: Color(0xFF8FF2F7)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // void addUserDialog(BuildContext context){
// //   TextEditingController _nameController = new TextEditingController();
// //   TextEditingController _EmailController = new TextEditingController();
// //   TextEditingController _PasswordController = new TextEditingController();
// //   TextEditingController _PhonenumberController = new TextEditingController();
// //   showDialog(context: context, builder: (context){
// //     return AlertDialog(
// //       title: Text('Add user'),
// //     );
// //   });
// // }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'home_screen.dart';  // Import your HomeScreen or whatever the next screen is

// class Login extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   static const mySnackBar = SnackBar(content: Text('Logged in successfully!'));

//   Future<void> _handleLogin(String email, String password, BuildContext context) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );

//       User? user = result.user;
//       ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => HomeScreen(),  // Replace HomeScreen with your next screen
//       ));
//       print('Login successful: ${user?.email}');
//     } catch (error) {
//       print('Login failed: $error');
//       // Handle the error, show an error message, etc.
//       // For example, you could show an error snackbar:
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $error')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("log in"),
//         backgroundColor: Colors.white,
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("images/background.jpg"),
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         child: Text('AH'),
//                       ),
//                       SizedBox(width: 20,),
//                       Text(
//                         'Welcome Back!',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: Icon(Icons.person),
//                     hintText: "Enter Username",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: Icon(Icons.email),
//                     hintText: "Enter your Email",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: Icon(Icons.lock),
//                     hintText: "Enter Password",
//                     suffixIcon: Icon(Icons.remove_red_eye,),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 60),
//                 Container(
//                   margin: EdgeInsets.only(left: 10, right: 10),
//                   width: 365,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Replace these values with actual email and password inputs
//                       _handleLogin('user@example.com', 'password123', context);
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                         Colors.teal,
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                     child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const Text(
//                   "Don't have an account?",
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => Signup(),
//                     ));
//                   },
//                   child: const Text(
//                     'Sign up Here',
//                     style: TextStyle(color: Color(0xFF8FF2F7)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

      
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_screen.dart'; 
import 'signup.dart'; 

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const mySnackBar = SnackBar(content: Text('Logged in successfully!'));

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  

  Future<void> _handleLogin(BuildContext context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      User? user = result.user;

      // Fetch additional user data from Firestore
      DocumentSnapshot<Map<String, dynamic>> userData =
          await _firestore.collection('users').doc(user?.uid).get();

      // Access user data like this
      String userName = userData.data()?['name'] ?? 'Default Name';

      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            userName: userName,
            userEmail: user?.email ?? 'yourUserEmail',
          ),
        ),
      );

      print('Login successful: ${user?.email}');
      print('User name: $userName');
    } catch (error) {
      print('Login failed: $error');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: $error')));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Log In"),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/background.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // CircleAvatar(
                      //   child: Text(''),
                      // ),
                      // SizedBox(width: 20,),
                      Text(
                        'Welcome Back!',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                controller: _passwordController,
                textAlign: TextAlign.center,
                obscureText: _obscureText, // Use a variable to toggle password visibility
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Enter Password",
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
                const SizedBox(height: 60),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 365,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _handleLogin(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.teal,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Signup(),
                    ));
                  },
                  child: const Text(
                    'Sign up Here',
                    style: TextStyle(color: Color(0xFF8FF2F7)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


