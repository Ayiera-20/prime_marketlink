import 'package:flutter/material.dart';

class PersonalDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Personal Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'First Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            SizedBox(height: 16.0),
           SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                    },
                style: ButtonStyle(
      //             shape: RoundedRectangleBorder(
      // borderRadius: BorderRadius.circular(20.0),
                  
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 221, 181, 49)),
                  textStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.black)),
                  
                ),
                clipBehavior: Clip.antiAlias,
                child: const Text('Save'),
              ),
           ),
          ],
        ),
      ),
    );
  }
}
