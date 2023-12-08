import 'package:flutter/material.dart';

class Highlights extends StatelessWidget {
  const Highlights({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        toolbarHeight: 60,
      centerTitle: true,
      title: const Text(
        'Insights',
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 20),
      ),
      backgroundColor: Colors.teal,
    ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox( height: 40),
            Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 150,
              child: Text('Featured \n Businesses'),
              color: Colors.amber,
            ),
            
            Container(
              color: Colors.teal,
              child: Column(
                children: [
                  Row(
                    children: [
                      Card(
                        color: Colors.amber,
                        child: Container(
                          height: 60,
                          width: 60,
                          child: Padding(padding: EdgeInsets.only(top: 20, left: 5),
                          child: Text('Unilink'),
                          ),
                        ),
                        
                      ),
                      Card(
                        color: Colors.amber,
                        child: Container(
                          height: 60,
                          width: 60,
                          child: Padding(padding: EdgeInsets.only(top: 20, left: 5),
                          child: Text('Unilink'),
                          ),
                        ),
                        
                      ),
                      Card(
                        color: Colors.amber,
                        child: Container(
                          height: 60,
                          width: 60,
                          child: Padding(padding: EdgeInsets.only(top: 20, left: 5),
                          child: Text('Unilink'),
                          ),
                        ),
                        
                      ),
                    ],
                  ),
            
                    SizedBox(height: 10,),
            
                  Row(
                children: [
                  Card(
                    color: Colors.amber,
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Padding(padding: EdgeInsets.only(top: 20, left: 5),
                      child: Text('Unilink'),
                      ),
                    ),
                    
                  ),
                  Card(
                    color: Colors.amber,
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Padding(padding: EdgeInsets.only(top: 20, left: 5),
                      child: Text('Unilink'),
                      ),
                    ),
                    
                  ),
                  Card(
                    color: Colors.amber,
                    child: Container(
                      height: 60,
                      width: 60,
                      child: Padding(padding: EdgeInsets.only(top: 20, left: 5),
                      child: Text('Unilink'),
                      ),
                    ),
                    
                  ),
                ],
              ),
                ],
              ),
            ),
          
            


          ],
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only( right: 250),
          child: Text('Upcoming Events'),
        ),
        SizedBox(height: 5,),
        Column(
          children: [
            SingleChildScrollView(
        scrollDirection: Axis.horizontal,
            child: Row(
              children: [
            Card(
                  child: Column(
                    children: [
                      Container(
                      height: 140, 
                      width: 140,
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
                  child: Text('Event 1'),
                      )
                    ],
                  ),


                ),
                Card(
                  child: Column(
                    children: [
                      Container(
                      height: 140, 
                      width: 140,
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
                  child: Text('Event 1'),
                      )
                    ],
                  ),


                ),
                Card(
                  child: Column(
                    children: [
                      Container(
                      height: 140, 
                      width: 140,
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
                  child: Text('Event 1'),
                      )
                    ],
                  ),


                ),
                  ],
            )
            ),
            
          ],
        ),
        SizedBox(height: 30,),
        Card(
          color: Colors.amber,
          child: Container(
          height: 150,
          width: 350,
          child: Padding(padding: EdgeInsets.only(top: 60, left: 100),
          child: Text('Unilink'),
           ),
            ),        
           ),

           SizedBox(height: 20,),

             Card(
          color: Colors.amber,
          child: Container(
          height: 150,
          width: 350,
          child: Padding(padding: EdgeInsets.only(top: 60, left: 100),
          child: Text('Unilink'),
           ),
            ),        
           ),
        
        


            
          ],
        ),
        
        


      ),
    );
  }
}