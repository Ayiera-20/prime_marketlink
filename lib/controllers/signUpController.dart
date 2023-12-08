import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prime_marketlink/screens/home_screen.dart';
import 'package:prime_marketlink/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController businessTypeController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController companySizeController = TextEditingController();
  final TextEditingController industryController = TextEditingController();

  static const mySnackBar = SnackBar(content: Text('You are now Signed up!'));

  Future<void> signUp(BuildContext context) async {
    try {
      // Create user in Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Store user data in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': nameController.text,
        'phone': phoneController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'profession':professionController.text,
        'companyName': companyNameController.text,
        'location': locationController.text,
        'businessType': businessTypeController.text,
        'companySize': companySizeController.text,
        'industry': industryController.text,
        'companyWebsite': websiteController.text,
    });

      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ));
    } catch (e) {
      print('Error during sign-up: $e');
    }
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Login(),
    ));
  }

  // Dispose method to clean up TextEditingController instances
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    companyNameController.dispose();
    professionController.dispose();
    locationController.dispose();
    industryController.dispose();
    websiteController.dispose();
    businessTypeController.dispose();
    companySizeController.dispose();
    passwordController.dispose();
  }
}