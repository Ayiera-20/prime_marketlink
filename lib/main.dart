import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prime_marketlink/firebase_options.dart';
import 'package:prime_marketlink/screens/profile.dart';
import 'package:prime_marketlink/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase_service.dart';





Future <void> main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, );
    runApp( MyApp());

}
Future<void> initializeFirestore() async{
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference company = FirebaseFirestore.instance.collection('company');

}
// async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
 
// }
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.

  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      title: 'Prime Market Link',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(178, 149, 229, 233)),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Store data in Firestore
  Future<void> storeData(String collection, Map<String, dynamic> data) async {
    await _firestore.collection(collection).add(data);
  }

  // Fetch data from Firestore
  Future<List<Map<String, dynamic>>> fetchData(String collection) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firestore.collection(collection).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  // Update data in Firestore
  Future<void> updateData(String collection, String documentId, Map<String, dynamic> data) async {
    await _firestore.collection(collection).doc(documentId).update(data);
  }

  // Delete data from Firestore
  Future<void> deleteData(String collection, String documentId) async {
    await _firestore.collection(collection).doc(documentId).delete();
  }
}


