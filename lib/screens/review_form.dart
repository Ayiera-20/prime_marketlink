// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CustomerReviewsPage extends StatefulWidget {
//   CustomerReviewsPage({super.key});

//    final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   _CustomerReviewsPageState createState() => _CustomerReviewsPageState();
// }

// class _CustomerReviewsPageState extends State<CustomerReviewsPage> {
//   final TextEditingController _nameController = TextEditingController();
//   double _rating = 0.0;
//   final TextEditingController _commentController = TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(' Reviews Form', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.teal,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text('We value your feedback!', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
//             const SizedBox(height: 30,),
//             TextFormField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Your Anonymous Name'),
//             ),
//             const SizedBox(height: 16.0),
//             Text('Rating: $_rating'),
//             RatingBar.builder(
//               initialRating: _rating,
//               minRating: 0,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 30.0,
//               itemBuilder: (context, _) => const Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 setState(() {
//                   _rating = rating;
//                 });
//               },
//             ),
//             const SizedBox(height: 16.0),
//             TextFormField(
//               controller: _commentController,
//               decoration: const InputDecoration(
//                 labelText: 'Your Review',
//                 hintText: 'Write your review here...',
//               ),
//               maxLines: 5,
//             ),
//             const SizedBox(height: 18.0),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.amber 
//               ),
//               onPressed: () {
//                 // TODO: Implement form submission logic
//                 // Access the form data using _nameController.text, _rating, and _commentController.text
//                 print('Name: ${_nameController.text}');
//                 print('Rating: $_rating');
//                 print('Review: ${_commentController.text}');
//               },
//               child: const Text('Submit', style: TextStyle(fontWeight: FontWeight.bold),),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prime_marketlink/screens/home_screen.dart';

class CustomerReviewsPage extends StatefulWidget {
  CustomerReviewsPage({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  _CustomerReviewsPageState createState() => _CustomerReviewsPageState();
}

class _CustomerReviewsPageState extends State<CustomerReviewsPage> {
  final TextEditingController _nameController = TextEditingController();
  double _rating = 0.0;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews Form', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'We value your feedback!',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30,),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Your Anonymous Name'),
            ),
            const SizedBox(height: 16.0),
            Text('Rating: $_rating'),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30.0,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _commentController,
              decoration: const InputDecoration(
                labelText: 'Your Review',
                hintText: 'Write your review here...',
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 18.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: () async {
                // Access the form data
                String name = _nameController.text;
                double rating = _rating;
                String review = _commentController.text;

                // Validate the form data (add your own validation logic here if needed)

                // Get the current user
                User? user = widget._auth.currentUser;

                if (user != null) {
                  // User is signed in
                  String userId = user.uid;

                  // Create a new document in the 'reviews' collection
                  await widget._firestore.collection('reviews').add({
                    'userId': userId,
                    'name': name,
                    'rating': rating,
                    'review': review,
                    'timestamp': FieldValue.serverTimestamp(), // Add a timestamp for sorting
                  });

                  Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(
                  userName: 'yourUserName',
                  userEmail: 'yourUserEmail',
                ),
                  ));

                          ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Review submitted successfully!'),
                  duration: Duration(seconds: 2),
                ),
              );

                  // Print a success message
                  print('Review submitted successfully!');

                  // You can also navigate to another screen or show a success message to the user
                } else {
                  // User is not signed in, handle this case accordingly
                  print('User is not signed in.');
                }
              },
              child: const Text('Submit', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

