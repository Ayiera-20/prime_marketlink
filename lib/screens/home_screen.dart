import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
import 'package:prime_marketlink/components/side_bar.dart';
import 'package:prime_marketlink/screens/expand_business.dart';

class Caseroul extends StatefulWidget {
  const Caseroul({super.key});

  @override
  State<Caseroul> createState() => _CaseroulState();
}

class _CaseroulState extends State<Caseroul> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
final List<String> imageList = [
    'https://www.freepik.com/free-photo/workers-giving-ideas-new-project_899448.htm#query=businesses&position=4&from_view=search&track=sph&uuid=e096d5f6-9713-4e72-a7ad-8ce956e34ad3',
    'https://www.freepik.com/free-photo/businesspeople-having-discussion-office_9597592.htm#query=businesses&position=10&from_view=search&track=sph&uuid=e096d5f6-9713-4e72-a7ad-8ce956e34ad3',
    'https://www.freepik.com/free-vector/nairobi-kenya-skyline-white-background-flat-realistic-style-with-famous-landmarks-modern-scraper-buildings-vector-illustration-web-print-production_23307260.htm#query=Kenya&position=16&from_view=search&track=sph&uuid=7bee88eb-02c5-45bf-8c40-86dcbf782c82',
    // Add more image URLs as needed
  ];

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
      centerTitle: true,
      title: const Text(
        'Unlocking global business opportunities',
        style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 20),
      ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
           icon: const Icon(Icons.favorite),
              onPressed: () {
              },
        ),
        IconButton(
           icon: const Icon(Icons.business_center),
              onPressed: () {
              },
        ),
      ],
    ),
    

        bottomNavigationBar: MyBottomNavigationBar(),
         body: SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(right:30, left:30)),
          const TextField(
                    cursorColor: Color.fromARGB(24, 158, 158, 158),
                    decoration: InputDecoration(
                      fillColor: Color.fromARGB(53, 158, 158, 158),
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.camera_alt_rounded),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(12, 10)),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Text('Featured businesses', 
                  style: TextStyle(color: const Color.fromARGB(255, 180, 48, 48), fontSize: 16, fontWeight: FontWeight.bold)),
                  CarouselSlider(
                    items: imageList
                    .map((item) => Container(
                      child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ),
                    ))
                    .toList(), 
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    )), 
                
            Container(
              child:  const SingleChildScrollView(
              scrollDirection: Axis.horizontal, 
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.elliptical(10,12))
                      ),
                      elevation: 5,
                      
                      child: Text('Construction', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                    ),
                    Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      elevation: 5,
                      
                      child: Text('Technology', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                    ),
                    Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      elevation: 5,
                      
                      child: Text('Agriculture', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                    ),

                      ],
                    ),
                     Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 20,
                          
                          child: Card(
                            margin: EdgeInsets.all(10),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      elevation: 5,
                      
                      child: Text('Toursim', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                    ),

                        ),
                        
                    Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      elevation: 5,
                      
                      child: Text('Finance', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                    ),
                    Card(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                      ),
                      elevation: 5,
                      
                      child: Text('More', style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),),
                    ),

                      ],
                    )
                ],
              ),
              ),
            ),
            Container(
              child: Column(
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Expand your business', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Expandbusiness(),
                    ));
                  },
                  child: const Text(
                    'See More',
                    style: TextStyle(color: Color.fromARGB(255, 134, 10, 51), decoration: TextDecoration.underline),
                  ),
                ), 
                        
                      ],
                    ),
                  Row(
                    children: [
                      Card(
                        child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/business-woman.jpg"),fit: BoxFit.cover)),
                          child: Text('Kenya-International Partnerships'),
                        ),
                      ),
                      Card(
                        child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/business-woman.jpg"),fit: BoxFit.cover)),
                          child: Text('Market research needs'),
                        ),
                      ),
                    ],
                  ),
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


    