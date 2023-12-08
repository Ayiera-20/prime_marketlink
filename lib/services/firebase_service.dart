// services/firebase_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  Future<void> readData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();

    querySnapshot.docs.forEach((doc) {
      print('User ID: ${doc.id}, Name: ${doc['name']}, Email: ${doc['email']}, phoneNumber: ${doc['phoneNumber']}, Password: ${doc['Password']},');
    });
  }
}
