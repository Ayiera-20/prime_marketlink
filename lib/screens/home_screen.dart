import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
import 'package:prime_marketlink/components/side_bar.dart';
import 'package:prime_marketlink/main.dart';
import 'package:prime_marketlink/screens/about_us.dart';
import 'package:prime_marketlink/screens/expand_business.dart';
import 'package:prime_marketlink/screens/home_highlights.dart';
import 'package:prime_marketlink/screens/industries.dart';
import 'package:prime_marketlink/screens/review_form.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

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
                  ImageSlideshow(

                    /// Width of the [ImageSlideshow].
                    width: double.infinity,

                    /// Height of the [ImageSlideshow].
                    height: 220,

                    /// The page to show when first creating the [ImageSlideshow].
                    initialPage: 0,

                    /// The color to paint the indicator.
                    indicatorColor: Colors.blue,

                    /// The color to paint behind th indicator.
                    indicatorBackgroundColor: Colors.grey,

                    /// Called whenever the page in the center of the viewport changes.
                    onPageChanged: (value) {
                      print('Page changed: $value');
                    },

                    /// Auto scroll interval.
                    /// Do not auto scroll with null or 0.
                    autoPlayInterval: 3000,

                    /// Loops back to first slide.
                    isLoop: true,

                    /// The widgets to display in the [ImageSlideshow].
                    /// Add the sample image file into the images folder
                    children: [
                      GestureDetector(
                                              onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => Highlights(), 
                                              ));
                                            },
                                            child: Container(
                                              width: 400,
                                              margin: EdgeInsets.all(6.0), 
                                                    decoration: BoxDecoration( 
                                                borderRadius: BorderRadius.circular(8.0), 
                                                image: const DecorationImage( 
                                                  image: AssetImage("images/background.jpg"), 
                                                  fit: BoxFit.cover, 
                                                ), 
                                              ),
                                              padding: EdgeInsets.only(left: 20, top: 80), 
                                              child: const Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Featured Businesses',
                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                                                    ),
                                                    Text(
                                                      'Click to dicover more',
                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12,),
                                                    ),
                                                    // Add more Text widgets as needed
                                                  ],
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
                              child: const Text('About Us', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
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
                              child: const Text('Upcoming Events', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
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
                  ),
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
             SizedBox(height: 30,),
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
                      height: 160, 
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
                      height: 160, 
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


    