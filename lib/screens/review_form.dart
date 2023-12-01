import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomerReviewsPage extends StatefulWidget {
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
        title: Text('Customer Reviews Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Your Name'),
            ),
            SizedBox(height: 16.0),
            Text('Rating: $_rating'),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30.0,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Your Review',
                hintText: 'Write your review here...',
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement form submission logic
                // Access the form data using _nameController.text, _rating, and _commentController.text
                print('Name: ${_nameController.text}');
                print('Rating: $_rating');
                print('Review: ${_commentController.text}');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
