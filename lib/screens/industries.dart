import 'package:flutter/material.dart';

class Industries extends StatefulWidget {
  const Industries({super.key});

  @override
  State<Industries> createState() => _IndustriesState();
}

class _IndustriesState extends State<Industries> {

//  final double appBarHeight = 100.0;
//   final double spaceAroundRoundButton = 4.0;
//   final double roundedButtonSize = 64.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20))),
      centerTitle: true,
      title: const Text(
        'Connecting businesses',
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 20),
      ),
      backgroundColor: Colors.teal,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
           icon: const Icon(Icons.notification_add_rounded),
              onPressed: () {
              },
        ),
        IconButton(
           icon: const Icon(Icons.star),
              onPressed: () {
              },
        ),
      ],
    ),

    body: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          
          Row(
            children: [
              Card(
                color: Colors.black,
                child: Container(
                  width: 150,
               height: 40,
        
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, 
              ),
              
                  child: const Text('industry', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                ),
                 Card(
                color: Colors.black,
                child: Container(
                  width: 150,
               height: 40,
        
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, 
              ),
              
                  child: const Text('Connect with people', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                ),
              

            ],
          ),
          Row(
            children: [
              Card(
                color: Colors.black,
                child: Container(
                  width: 180,
               height: 200,
        
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              
                  child: const Text('industry', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                ),

                  Card(
                color: Colors.black,
                child: Container(
                  width: 180,
               height: 200,
        
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              
                  child: const Text('connect with people', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                ),
            ],
          ),
          SizedBox(height: 40,),
          Row(
            children: [
               Card(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration:  BoxDecoration(borderRadius: BorderRadius.circular(9.9),
                    image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.cover),
                  shape: BoxShape.rectangle
                  ),
                child: Text('Events'),
                ),
                          
                ),
                Card(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration:  BoxDecoration(borderRadius: BorderRadius.circular(9.9),
                    image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.cover),
                  shape: BoxShape.rectangle
                  ),
                child: Text('Events'),
                ),
                          
                ),


            ],
          )
        ],

      ),
    ),
    );
  }
}