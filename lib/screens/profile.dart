import 'package:flutter/material.dart';
import 'package:prime_marketlink/screens/basic_info.dart';
import 'package:prime_marketlink/screens/company_info.dart';
import 'package:prime_marketlink/screens/review_form.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<String> items = ['Foreign Business', 'Kenyan Business'];
  String? selectedItem = 'Foreign Business';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("images/business-woman.jpg")
            ),
           Text('Elis Ross'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  value: selectedItem,
                  items: items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: TextStyle(),),
                    );
                  }).toList(),
                  onChanged: (item) {
                    setState(() {
                      selectedItem = item;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Card(
                  color: Colors.amber,
                          child: Text('Successful connections'),
                ),
                Card(
                  color: Colors.amber,
                          child: Text('12'),
                ),
              ],
            ),
            ListTile(
              title: Text('Personal Details'),
              tileColor: Colors.black,
              textColor: Colors.white,
              minLeadingWidth: 50,
              onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PersonalDetails(),
                ),
              );
            },
            ),
            ListTile(
              title: Text('Company info'),
              tileColor: Colors.black,
              textColor: Colors.white,
              minLeadingWidth: 50,
              onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Companyinfo(),
                ),
              );
            },
             
            ),
              ListTile(
              title: Text('Market Research needs'),
              tileColor: Colors.black,
              textColor: Colors.white,
              minLeadingWidth: 50,
            ),
            ListTile(
              title: Text('Preferences and goals'),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            ListTile(
              title: Text('Market and target audience'),
              tileColor: Colors.black,
              textColor: Colors.white,
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomerReviewsPage()),
            );
          },
          child: Card(
            color: Colors.amber,
            child: Text('Rate us'),
            

           ) ,

            ),
          
          ],
        ),
      ),
    );
  }
}
