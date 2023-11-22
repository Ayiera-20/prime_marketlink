import 'package:flutter/material.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';

class Expandbusiness extends StatefulWidget {
  const Expandbusiness({super.key});

  @override
  State<Expandbusiness> createState() => _ExpandbusinessState();
}

class _ExpandbusinessState extends State<Expandbusiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Column(
        children: [
          Card(
            child: Container(
              width: 450,
              height: 200,
              decoration: 
                BoxDecoration(image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.cover), shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15.9)),
              ),
            ),
            Text('Kenya-International Prtnerships'),
            SizedBox(height: 30,),
          Card(
            child: Container(
              width: 450,
              height: 200,
              decoration: 
                BoxDecoration(image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.cover), shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15.9)),
              ),
            ),
            Text('Market Research'),
            SizedBox(height: 30,),
          Card(
            child: Container(
             width: 450,
              height: 200,
              decoration: 
                BoxDecoration(image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.cover), shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15.9)),
              ),
            ),
            Text('Personalized Services'),
        ],
        

      ),
     
    

    );
  }
}