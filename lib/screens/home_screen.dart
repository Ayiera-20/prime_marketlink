
import 'package:flutter/material.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
import 'package:prime_marketlink/components/sidebar.dart';
import 'package:prime_marketlink/screens/about_us.dart';
import 'package:prime_marketlink/screens/home_highlights.dart';
import 'package:prime_marketlink/screens/industries.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prime_marketlink/screens/connect_users.dart';
import 'package:prime_marketlink/screens/market_tips.dart';





class HomeScreen extends StatefulWidget {
  final String userName;
  final String userEmail;
  

  HomeScreen({required this.userName, required this.userEmail});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomSidebar(
  userName: widget.userName,
 userEmail: widget.userEmail,
  userProfile: UserProfile(
    uid: FirebaseAuth.instance.currentUser!.uid,
    displayName: FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
  ),
),


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
    
        bottomNavigationBar: MyBottomNavigationBar(
  user: FirebaseAuth.instance.currentUser!,
  onTabSelected: (index) {
    // Handle tab selection if needed
  },
  userProfile: UserProfile(
    uid: FirebaseAuth.instance.currentUser!.uid,
    displayName: FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
  ),
),


         body: Stack(
          children: [
         SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child: Container(
          margin: const EdgeInsets.only(top: 20, right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(padding: EdgeInsets.only(right:30, left:30)),
          TextField(
            controller: searchController,
            onChanged: (value) {
              // Handle onChanged event
            },
            cursorColor: Colors.grey[400],
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.grey[500],
                fontSize: 14,
              ),
            ),
          ),

                  const SizedBox(height: 20),              
                  ImageSlideshow(

                    /// Width of the [ImageSlideshow].
                    width: double.infinity,

                    /// Height of the [ImageSlideshow].
                    height: 230,

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
                                              margin: const EdgeInsets.all(6.0), 
                                                    decoration: BoxDecoration( 
                                                borderRadius: BorderRadius.circular(8.0), 
                                                image:  DecorationImage( 
                                                  image: AssetImage("images/construction.jpg"), 
                                                  fit: BoxFit.cover,
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black.withOpacity(0.4),
                                                    BlendMode.darken,
                                                  ),
                                                ), 
                                              ),
                                              padding: const EdgeInsets.only(left: 20, top: 80), 
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
                                                builder: (context) => const Aboutus(), 
                                              ));
                                            },
                                            child: Container( 
                                              width: 400,
                              margin: const EdgeInsets.all(6.0), 
                              decoration: BoxDecoration( 
                                borderRadius: BorderRadius.circular(8.0), 
                                image:  DecorationImage( 
                                  image: AssetImage("images/yes.jpg"), 
                                  fit: BoxFit.cover, 
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.6),
                                       BlendMode.darken,
                                  ),
                                ), 
                              ), 
                              padding: const EdgeInsets.only(left: 20, top: 80), 
                              child: const Text('About Prime Market Link', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                              ),
                              
                                            ), 
                                            ),
                              
                                            //3rd Image of Slider 
                                            GestureDetector(
                                              onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) =>  Highlights(), 
                                              ));
                                            },
                                            child: Container( 
                                              width: 400,
                              margin: const EdgeInsets.all(6.0), 
                              decoration: BoxDecoration( 
                                borderRadius: BorderRadius.circular(8.0), 
                                image: DecorationImage( 
                                  image: AssetImage("images/events.jpg"),  
                                  fit: BoxFit.cover, 
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.6),
                                    BlendMode.darken,
                                   ),
                                ), 
                              ), 
                              padding: const EdgeInsets.only(left: 20, top: 80), 
                              child: const Text('Upcoming Events', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                              ),
                                            ), 
                                            ),
                              
                                            //4th Image of Slider 
                                            GestureDetector(
                                              onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) =>  MarketTips(), 
                                              ));
                                            },
                                            child: Container( 
                                              width: 400,
                              margin: const EdgeInsets.all(6.0), 
                              decoration: BoxDecoration( 
                                borderRadius: BorderRadius.circular(8.0), 
                                image: DecorationImage( 
                                  image: AssetImage("images/insights.jpg"),  
                                  fit: BoxFit.cover, 
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.6),
                                    BlendMode.darken,
                                     ),
                                ), 
                              ), 
                              padding: const EdgeInsets.only(left: 20, top: 80), 
                              child: const Text('Market Research \n Market Insights', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),
                              ),
                              ),)
                              
                    ],
                  ),
                  const SizedBox(height: 20,),
           
            Container(
              // child:  SingleChildScrollView(
              // scrollDirection: Axis.horizontal, 
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('Industries'),
                        ),
                        const SizedBox(width: 120,),
                        Padding(
                          padding: EdgeInsets.only(right: 0, left: 0),
                         child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Industries(),
                    ));
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Color.fromARGB(255, 134, 10, 51), decoration: TextDecoration.underline),
                  ),
                ), )

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
              child: const Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20,),
                child: Text('Construction', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
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
              child: const Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Text('Technology', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
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
              child: const Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Text('Agriculture', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
                        ),
                ),
                      ],
                    ),

                    const SizedBox(height:4),
                    

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
              child: const Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20,),
                child: Text('Tourism', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
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
              child: const Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Text('Finance', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
                        ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Industries(),
                    ));
                  },
                  child: Card(
                color: Colors.black,
                child: Container(
                  width: 100,
               height: 40,
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              child: const Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                child: Text('More...', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
                        ),
                ),)
                      ],
                    ),
            
                ],
              ),
              ),
            // ),
             const SizedBox(height: 30,),
            Container(
              child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const Text('Expand your business', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                      TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Aboutus(),
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
                        image: const DecorationImage(
                          image: AssetImage("images/global.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      const Divider(height: 10),
                      Container(
                        
                        padding: const EdgeInsets.all(16.0),
                  child: const Text('Business Expansion \n Consultation', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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
                        image: const DecorationImage(
                          image: AssetImage("images/connected.png"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      const Divider(height: 10),
                      Container(
                        
                        padding: const EdgeInsets.all(16.0),
                  child: const Text('International Trade \n Facilitation', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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
                        image: const DecorationImage(
                          image: AssetImage("images/Market.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      const Divider(height: 10),
                      Container(
                        
                        padding: const EdgeInsets.all(16.0),
                  child: const Text('Market Research', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
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


    