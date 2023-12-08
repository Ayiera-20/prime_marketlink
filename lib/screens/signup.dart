// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:prime_marketlink/screens/home_screen.dart';
// import 'package:prime_marketlink/screens/login.dart';


// class Signup extends StatelessWidget {
  
//   static const mySnackBar = SnackBar(content:Text('You are now Signed up!'));

//   final signUpController = SignupController ();
//   @override
//    Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Sign Up"),
//         backgroundColor: Colors.white,
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Positioned background image to cover the whole page
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
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
//             margin: const EdgeInsets.all(20.0), 
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Welcome to Prime Market Link',
//               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 30),
//             const TextField(
//               textAlign: TextAlign.center,
//               decoration: InputDecoration(    
//                 prefixIcon: Icon(Icons.person),            
//                 hintText: "Enter your Full Name",
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const TextField(
//               textAlign: TextAlign.center,
//               decoration: InputDecoration( 
//                 prefixIcon: Icon(Icons.phone),                               
//                 hintText: "Enter Phone Number",
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const TextField(
//               textAlign: TextAlign.center,
//               decoration: InputDecoration( 
//                 prefixIcon: Icon(Icons.email),               
//                 hintText: "Enter Email",
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             const TextField(
//               textAlign: TextAlign.center,
//               obscureText: true,
//               decoration: InputDecoration(  
//                 prefixIcon: Icon(Icons.lock),              
//                 hintText: "Enter Password",
//                 filled: true,
//                 suffixIcon: Icon(Icons.remove_red_eye),
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                 ),
//               ),
//             ),
//            const SizedBox(height: 50),
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
//                     child: const Text('Sign Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
//                   ),
//                 ),
//             const SizedBox(height: 30),
//             const Text(
//               'Already have an account?',
//               style: TextStyle(color: Colors.white),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => Login(),
//                 ));
//               },
//               child: const Text('Login Here', style: TextStyle(color:Color(0xFF8FF2F7) ),),
//             ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:prime_marketlink/screens/home_screen.dart';
// import 'package:prime_marketlink/screens/login.dart';

// class Signup extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   static const mySnackBar = SnackBar(content: Text('You are now Signed up!'));

//   Future<void> _signUp(BuildContext context) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );

//       // You can add additional user information to Firebase Firestore or Realtime Database here
//       // For simplicity, I'm just showing a success message for now.

//       ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => HomeScreen(),
//       ));
//     } catch (e) {
//       // Handle errors such as invalid email, weak password, etc.
//       print('Error during sign-up: $e');
//       // You can display an error message to the user if needed.
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Sign Up"),
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
//                   colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(0.4),
//                     BlendMode.darken,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Welcome to Prime Market Link',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   controller: _nameController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.person),
//                     hintText: "Enter your Full Name",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   controller: _phoneController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.phone),
//                     hintText: "Enter Phone Number",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   controller: _emailController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.email),
//                     hintText: "Enter Email",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   controller: _passwordController,
//                   textAlign: TextAlign.center,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.lock),
//                     hintText: "Enter Password",
//                     filled: true,
//                     suffixIcon: Icon(Icons.remove_red_eye),
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 Container(
//                   margin: EdgeInsets.only(left: 10, right: 10),
//                   width: 365,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _signUp(context);
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
//                     child: const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const Text(
//                   'Already have an account?',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => Login(),
//                     ));
//                   },
//                   child: const Text(
//                     'Login Here',
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
      


// class SignupController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   static const mySnackBar = SnackBar(content: Text('You are now Signed up!'));

//   Future<void> signUp(BuildContext context) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       // You can add additional user information to Firebase Firestore or Realtime Database here
//       // For simplicity, I'm just showing a success message for now.

//       ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => HomeScreen(),
//       ));
//     } catch (e) {
//       // Handle errors such as invalid email, weak password, etc.
//       print('Error during sign-up: $e');
//       // You can display an error message to the user if needed.
//     }
//   }

//   void navigateToLogin(BuildContext context) {
//     Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => Login(),
//     ));
//   }
// }

// class Signup extends StatelessWidget {
//   final SignupController _controller = SignupController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Sign Up"),
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
//                   colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(0.4),
//                     BlendMode.darken,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Welcome to Prime Market Link',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   controller: _controller.nameController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.person),
//                     hintText: "Enter your Full Name",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   controller: _controller.phoneController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.phone),
//                     hintText: "Enter Phone Number",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   controller: _controller.emailController,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.email),
//                     hintText: "Enter Email",
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const TextField(
//                   controller: _controller.passwordController,
//                   textAlign: TextAlign.center,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.lock),
//                     hintText: "Enter Password",
//                     filled: true,
//                     suffixIcon: Icon(Icons.remove_red_eye),
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 Container(
//                   margin: EdgeInsets.only(left: 10, right: 10),
//                   width: 365,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _controller.signUp(context);
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
//                     child: const Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const Text(
//                   'Already have an account?',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     _controller.navigateToLogin(context);
//                   },
//                   child: const Text(
//                     'Login Here',
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





// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:prime_marketlink/screens/home_screen.dart';
// import 'package:prime_marketlink/screens/login.dart';

// class SignupController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   static const mySnackBar = SnackBar(content: Text('You are now Signed up!'));

//   Future<void> signUp(BuildContext context) async {
//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => HomeScreen(),
//       ));
//     } catch (e) {
//       print('Error during sign-up: $e');
//     }
//   }

//   void navigateToLogin(BuildContext context) {
//     Navigator.of(context).push(MaterialPageRoute(
//       builder: (context) => Login(),
//     ));
//   }

//   // Dispose method to clean up TextEditingController instances
//   void dispose() {
//     nameController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }
// }

// class Signup extends StatefulWidget {
//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final SignupController _controller = SignupController();

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Sign Up"),
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
//                   colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(0.4),
//                     BlendMode.darken,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Welcome to Prime Market Link',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 30),
//                 CustomTextField(
//                   controller: _controller.nameController,
//                   hintText: "Enter your Full Name",
//                   prefixIcon: Icons.person,
//                 ),
//                 const SizedBox(height: 30),
//                 CustomTextField(
//                   controller: _controller.phoneController,
//                   hintText: "Enter Phone Number",
//                   prefixIcon: Icons.phone,
//                 ),
//                 const SizedBox(height: 30),
//                 CustomTextField(
//                   controller: _controller.emailController,
//                   hintText: "Enter Email",
//                   prefixIcon: Icons.email,
//                 ),
//                 const SizedBox(height: 30),
//                 CustomTextField(
//                   controller: _controller.passwordController,
//                   hintText: "Enter Password",
//                   prefixIcon: Icons.lock,
//                   obscureText: true,
//                   suffixIcon: Icons.remove_red_eye,
//                 ),
//                 const SizedBox(height: 50),
//                 ElevatedButton(
//                   onPressed: () {
//                     _controller.signUp(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.teal,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: const Text(
//                     'Sign Up',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 const Text(
//                   'Already have an account?',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     _controller.navigateToLogin(context);
//                   },
//                   child: const Text(
//                     'Login Here',
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

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.prefixIcon,
//     this.obscureText = false,
//     this.suffixIcon,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final String hintText;
//   final IconData prefixIcon;
//   final bool obscureText;
//   final IconData? suffixIcon;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       textAlign: TextAlign.center,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         prefixIcon: Icon(prefixIcon),
//         suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
//         hintText: hintText,
//         filled: true,
//         fillColor: Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prime_marketlink/controllers/signUpController.dart';
import 'package:prime_marketlink/screens/home_screen.dart';
import 'package:prime_marketlink/screens/login.dart';



class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final SignupController _controller = SignupController();

    List<String> items = ['Foreign Business', 'Kenyan Business'];
  TextEditingController businessTypeController = TextEditingController();
  String? selectedItem = 'Foreign Business';

  List<String> itemsList1 = ['Company Size', 'less than 50', '50-100', '100-500', '500-1000'];
  TextEditingController companySizeController = TextEditingController();
  String? selectedItemList1 = 'Company Size';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
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
            margin: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Prime Market Link',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Flexible(child: 
                    CustomTextField(
                      controller: _controller.nameController,
                      hintText: "Enter your Name",
                      prefixIcon: Icons.person,
                    ),),
                   SizedBox(width: 10),
                   Flexible(child: 
                    CustomTextField(
                      controller: _controller.phoneController,
                      hintText: "Enter Phone Number",
                      prefixIcon: Icons.phone,
                    ),
                    )
                    
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Flexible(child:
                  
                    CustomTextField(
                      controller: _controller.emailController,
                      hintText: "Enter Email",
                      prefixIcon: Icons.email,
                    ), ),
                    SizedBox(width: 10),
                    Flexible(child: 
                    CustomTextField(
                  controller: _controller.professionController,
                  hintText: "Profession",
                  prefixIcon: Icons.work,
                ),
                    ),
                  ],
                ),
                 SizedBox(height:30),
                Row(
                  children: [
                     Flexible(child: 
                    CustomTextField(
                  controller: _controller.locationController,
                  hintText: "Enter Location",
                  prefixIcon: Icons.location_pin,
                ),
                    ),
                     SizedBox(width: 10),
                     Flexible(child: 
                    CustomTextField(
                  controller: _controller.companyNameController,
                  hintText: "Enter Company Name",
                  prefixIcon: Icons.business,
                ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(child: 
                   Container(
                    width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white, // Set the background color here
                      ),
                      child: DropdownButton<String>(
                        value: selectedItem,
                        items: items.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (item) {
                          setState(() {
                            selectedItem = item;
                            businessTypeController.text = item ?? '';
                            print('Selected Item : $selectedItem');
                          });
                        },
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        iconSize: 24,
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                      )),
                    ),
                    SizedBox(width: 10,),
                    Flexible(child: 
                    Container(
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white, // Set the background color here
                      ),
                      child: DropdownButton<String>(
                        elevation: 6,
                        value: selectedItemList1,
                        items: itemsList1.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                       onChanged: (String? newValue) {
                          if (newValue != null) {
                            setState(() {
                              selectedItemList1 = newValue;
                              companySizeController.text = newValue;
                              print('Selected Item List 1: $selectedItemList1');
                            });
                          }
                        },
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        iconSize: 24,
                        underline: Container(
                          height: 2,
                          color: Colors.black,
                        ),
                      ),
                    ),),

                                      ],
                                    ),
                 const SizedBox(height: 30),
                Row(
                  children: [
                     Flexible(child: 
                    CustomTextField(
                  controller: _controller.industryController,
                  hintText: "Industry",
                  prefixIcon: Icons.business,
                ),
                    ),
                     SizedBox(width: 10),
                     Flexible(child: 
                    CustomTextField(
                  controller: _controller.websiteController,
                  hintText: "Company Website URL",
                  prefixIcon: Icons.web,
                ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                CustomTextField(
                      controller: _controller.passwordController,
                      hintText: "Enter Password",
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                
                const SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: 365,
                  height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    _controller.signUp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),),
                const SizedBox(height: 30),
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    _controller.navigateToLogin(context);
                  },
                  child: const Text(
                    'Login Here',
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}
