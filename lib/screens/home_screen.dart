import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
import 'package:prime_marketlink/components/side_bar.dart';
import 'package:prime_marketlink/main.dart';
import 'package:prime_marketlink/screens/about_us.dart';
import 'package:prime_marketlink/screens/expand_business.dart';
import 'package:prime_marketlink/screens/industries.dart';
import 'package:prime_marketlink/screens/market_insights.dart';
import 'package:prime_marketlink/screens/review_form.dart';



// class Caseroul extends StatefulWidget {
//   const Caseroul({super.key});

//   @override
//   State<Caseroul> createState() => _CaseroulState();
// }

// class _CaseroulState extends State<Caseroul> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp();
//   }
// }
// final List<String> imageList = [
//     'https://www.freepik.com/free-photo/workers-giving-ideas-new-project_899448.htm#query=businesses&position=4&from_view=search&track=sph&uuid=e096d5f6-9713-4e72-a7ad-8ce956e34ad3',
//     'https://www.freepik.com/free-photo/businesspeople-having-discussion-office_9597592.htm#query=businesses&position=10&from_view=search&track=sph&uuid=e096d5f6-9713-4e72-a7ad-8ce956e34ad3',
//     'https://www.freepik.com/free-vector/nairobi-kenya-skyline-white-background-flat-realistic-style-with-famous-landmarks-modern-scraper-buildings-vector-illustration-web-print-production_23307260.htm#query=Kenya&position=16&from_view=search&track=sph&uuid=7bee88eb-02c5-45bf-8c40-86dcbf782c82',
//     // Add more image URLs as needed
//   ];

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        toolbarHeight: 60,
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20))),
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
    
    

        bottomNavigationBar: MyBottomNavigationBar(),
         body: Stack(
          children: [
  
  
        
         SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child: Container(
          margin: EdgeInsets.only(top: 20, right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(padding: EdgeInsets.only(right:30, left:30)),
          const TextField(
                    cursorColor: Color.fromARGB(24, 158, 158, 158),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(53, 158, 158, 158),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(vertical:10),
                      prefixIcon: Padding(padding: EdgeInsets.only( bottom: 30, right: 15, left: 0.2),
                      child: Align(
                        widthFactor: 1.0,
                        heightFactor: 1.0,
                        child: Icon(
                          Icons.search,
                        ),
                      ),),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(12, 10)),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),


                  Container(
                    height: 200,
                    
                    child: ListView( 
                          children: [ 
                            CarouselSlider( 
                                items: [ 
                                    //1st Image of Slider 
                                  GestureDetector(
                                    onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => InsightsPage(), 
                                    ));
                                  },
                                  child: Container(
                                    width: 400,
                                    margin: EdgeInsets.all(6.0), 
                                          decoration: BoxDecoration( 
                                      borderRadius: BorderRadius.circular(8.0), 
                                      image: DecorationImage( 
                                        image: AssetImage("images/background.jpg"), 
                                        fit: BoxFit.cover, 
                                      ), 
                                    ),
                                    padding: EdgeInsets.only(left: 20, top: 80), 
                                    child: Text('Featured \n Businesses', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                                    ), 

                                  ),

                                  ),
                    
                                
                             
                    
                                  //2nd Image of Slider 
                                  GestureDetector(
                                    onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Aboutus(), 
                                    ));
                                  },
                                  child: Container( 
                                    width: 400,
                    margin: EdgeInsets.all(6.0), 
                    decoration: BoxDecoration( 
                      borderRadius: BorderRadius.circular(8.0), 
                      image: DecorationImage( 
                         image: AssetImage("images/background.jpg"), 
                        fit: BoxFit.cover, 
                      ), 
                    ), 
                     padding: EdgeInsets.only(left: 20, top: 80), 
                    child: Text('About Us', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                    ),
                    
                                  ), 
                                  ),
                    
                                  //3rd Image of Slider 
                                  GestureDetector(
                                    onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Aboutus(), 
                                    ));
                                  },
                                  child: Container( 
                                     width: 400,
                    margin: EdgeInsets.all(6.0), 
                    decoration: BoxDecoration( 
                      borderRadius: BorderRadius.circular(8.0), 
                      image: DecorationImage( 
                         image: AssetImage("images/background.jpg"),  
                        fit: BoxFit.cover, 
                      ), 
                    ), 
                     padding: EdgeInsets.only(left: 20, top: 80), 
                    child: Text('Upcoming Events', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                    ),
                                  ), 
                                  ),
                    
                                  //4th Image of Slider 
                                  Container( 
                                     width: 400,
                    margin: EdgeInsets.all(6.0), 
                    decoration: BoxDecoration( 
                      borderRadius: BorderRadius.circular(8.0), 
                      image: DecorationImage( 
                         image: AssetImage("images/background.jpg"),  
                        fit: BoxFit.cover, 
                      ), 
                    ), 
                     padding: EdgeInsets.only(left: 20, top: 80), 
                    child: Text('Market Research \n Market Insights', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                    ),
                                  ), 
                            ], 
                                
                              //Slider Container properties 
                                options: CarouselOptions( 
                                  height: 200.0, 
                                  // enlargeCenterPage: true, 
                                  autoPlay: true, 
                                  aspectRatio: 16 / 9, 
                                  autoPlayCurve: Curves.fastOutSlowIn, 
                                  enableInfiniteScroll: true, 
                                  autoPlayAnimationDuration: Duration(milliseconds: 800), 
                                  viewportFraction: 0.8, 
                                ), 
                            ), 
                          ], 
                        ),
                  ), 
                   Row( 
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                    Container(
                      margin: EdgeInsets.only(left: 50),
                      child: Text('Discover more')),
                      SizedBox(width: 24,),
                    Icon(Icons.arrow_forward)
                  ],),

                  SizedBox(height: 20,),
                  
                
            Container(
              // child:  SingleChildScrollView(
              // scrollDirection: Axis.horizontal, 
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text('industries'),
                        ),
                        SizedBox(width: 240,),
                         TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Industries(),
                    ));
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Color.fromARGB(255, 134, 10, 51), decoration: TextDecoration.underline),
                  ),
                ), 

                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Card(
                color: Colors.black,
                child: Container(
                  width: 120,
               height: 40,
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20,),
                child: const Text('Construction', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
                        ),
                ),
                  Card(
                color: Colors.black,
                child: Container(
                  width: 120,
               height: 40,
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: const Text('Technology', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
                        ),
                ),
                  Card(
                color: Colors.black,
                child: Container(
                  width: 110,
               height: 40,
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: const Text('Agriculture', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
                        ),
                ),
                      ],
                    ),

                    SizedBox(height:4),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       Card(
                color: Colors.black,
                child: Container(
                  width: 120,
               height: 40,
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20,),
                child: const Text('Tourism', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
                        ),
                ),
                  Card(
                color: Colors.black,
                child: Container(
                  width: 120,
               height: 40,
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: const Text('Finance', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
                        ),
                ),
                  Card(
                color: Colors.black,
                child: Container(
                  width: 100,
               height: 40,
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: const Text('More...', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
                        ),
                ),
                      ],
                    ),
            
                ],
              ),
              ),
            // ),
             SizedBox(height: 10,),
            Container(
              child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const Text('Expand your business', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Expandbusiness(),
                    ));
                  },
                  child: const Text(
                    'See More',
                    style: TextStyle(color: Color.fromARGB(255, 134, 10, 51), decoration: TextDecoration.underline),
                  ),
                ), 
                        
                      ],
                    ),
                   
                  SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Padding(padding: const EdgeInsets.only(bottom: 16, right: 5),
                child: Card(
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
                  child: Text('Business Partnership'),
                      )
                    ],
                  ),


                ),
                
                
                ),
                 Padding(padding: const EdgeInsets.only(bottom: 16, right: 5),
                child: Card(
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 190,
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
                  child: Text('One on One Consultation'),
                      )
                    ],
                  ),


                ),
                
                
                ),
              
            ],
          ),
             
                ),

                  SizedBox(height:20),
                  Card(
                        child: Container(
                          width: 450,
                          height: 200,
                          decoration:  BoxDecoration(image: DecorationImage(image: AssetImage("images/background.jpg"),fit: BoxFit.cover),
                          shape: BoxShape.rectangle
                          ),
                          child: Text('Events'),
                          ),
                          
                        ),
                ],
                
              ),
            ) 
            
        ],
        
  
      ),
    ),
    ),
      ],
         ),
    );
  }
}


    