import 'package:flutter/material.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: const Text(
        'Prime Market Link',
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 20),
      ),
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
       bottomNavigationBar: MyBottomNavigationBar(),
         body: SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child: Container(
          child: Column(
        children: [
          Container(
            child: Image.asset("images/events.jpg"),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6)),
            ),  
            Container(
              height: 100,
              child: const SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
                child: Row(
                  children: [
                    Card(
                      color: Colors.lightBlueAccent,
                      child: Text('International partnerships'),
                    ),
                    Card(
                      color: Colors.amber,
                      child: Text('Local Partnerships'),
                    ),
                    Card(
                      color: Colors.yellow,
                      child: Text('Personalized consultation'),
                    ),
                    Card(
                      color: Colors.blueGrey,
                      child: Text('Market Research needs'),
                    ),
                    Card(
                      color: Colors.blueGrey,
                      child: Text('Industries'),
                    ),
                ],
              ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Card(
                    child: Image.asset(
        'images/events.jpg',
        fit: BoxFit.cover,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
                  ),
                  Card(),
                ],
                
              ),
            ) 
            
        ],
  
      ),
    ),
    ),
    );
  }
}
    