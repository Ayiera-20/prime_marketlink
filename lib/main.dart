import 'package:flutter/material.dart';
import 'package:prime_marketlink/firebase_options.dart';
import 'package:prime_marketlink/screens/post_screen.dart';
import 'package:prime_marketlink/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostProvider()),
        // Add other providers as needed
      ],
      child: const MyApp(),
    ),
  );
}

// Future <void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, );
//     runApp( MyApp());

// }
Future<void> initializeFirestore() async {
  // Initialize Firestore collections if needed
  // FirebaseFirestore.instance.collection('users');
  // FirebaseFirestore.instance.collection('messages');
  // FirebaseFirestore.instance.collection('posts');
}

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
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          primary: Colors.teal,
          secondary: const Color(0xFF8FF2F7),
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 2,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
        cardTheme: const CardThemeData(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
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
  Future<void> updateData(
      String collection, String documentId, Map<String, dynamic> data) async {
    await _firestore.collection(collection).doc(documentId).update(data);
  }

  // Delete data from Firestore
  Future<void> deleteData(String collection, String documentId) async {
    await _firestore.collection(collection).doc(documentId).delete();
  }
}
