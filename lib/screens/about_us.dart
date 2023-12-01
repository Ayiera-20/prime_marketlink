import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 160,
            child: AppBar(
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
          ),
          Column(
            children: [
               Padding(padding: EdgeInsets.all(16.0),
                child: Card(
                   margin: EdgeInsets.only(top: 90, left: 30, right: 30),
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.blue,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Section 1',
                    style: TextStyle(color: Colors.white),
                  ),
                      ),
                      Divider(height: 10),
                      Container(
                        
                        padding: EdgeInsets.all(16.0),
                  child: Text('Section 2'),
                      )
                    ],
                  ),


                ),
                
                
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 15, right: 10),
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: DecorationImage(
                          image: AssetImage("images/background.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      Divider(height: 10),
                      Container(
                        
                        padding: EdgeInsets.all(16.0),
                  child: Text('Section 2'),
                      )
                    ],
                  ),


                ),
                
                
                ),
                 Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 15),
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: DecorationImage(
                          image: AssetImage("images/background.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      Divider(height: 10),
                      Container(
                        
                        padding: EdgeInsets.all(16.0),
                  child: Text('Section 2'),
                      )
                    ],
                  ),


                ),
                
                
                ),
              
            ],
          ),
             
                ),


                SizedBox(height: 40,),


                 SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 15, right: 10),
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: DecorationImage(
                          image: AssetImage("images/background.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      Divider(height: 10),
                      Container(
                        
                        padding: EdgeInsets.all(16.0),
                  child: Text('Section 2'),
                      )
                    ],
                  ),


                ),
                
                
                ),
                 Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 15),
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: DecorationImage(
                          image: AssetImage("images/background.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      Divider(height: 10),
                      Container(
                        
                        padding: EdgeInsets.all(16.0),
                  child: Text('Section 2'),
                      )
                    ],
                  ),


                ),
                
                
                ),
              
            ],
          ),
             
                ),
          
               
            ],

          )
        ],
      ),
    );
  }
}