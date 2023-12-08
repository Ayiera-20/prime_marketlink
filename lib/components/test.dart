// import 'dart:html';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:prime_marketlink/components/bottom_navbar.dart';
// import 'package:prime_marketlink/components/side_bar.dart';

// class Caseroul extends StatefulWidget {
//   List<String> imageList;

//   Caseroul(this.imageList);
  

//   @override
//   State<Caseroul> createState() => _CaseroulState();
// }

// class _CaseroulState extends State<Caseroul> {
//   int _current = 0;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp();
  
// }
// final List<String> imageList = [
//     'https://www.freepik.com/free-photo/workers-giving-ideas-new-project_899448.htm#query=businesses&position=4&from_view=search&track=sph&uuid=e096d5f6-9713-4e72-a7ad-8ce956e34ad3',
//     'https://www.freepik.com/free-photo/businesspeople-having-discussion-office_9597592.htm#query=businesses&position=10&from_view=search&track=sph&uuid=e096d5f6-9713-4e72-a7ad-8ce956e34ad3',
//     'https://www.freepik.com/free-vector/nairobi-kenya-skyline-white-background-flat-realistic-style-with-famous-landmarks-modern-scraper-buildings-vector-illustration-web-print-production_23307260.htm#query=Kenya&position=16&from_view=search&track=sph&uuid=7bee88eb-02c5-45bf-8c40-86dcbf782c82',
//     // Add more image URLs as needed
//   ];
// //   List<Widget> imageSliders = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Initialize imageSliders here
// //     imageSliders = widget.imageList.map((item) => Container(
// //       child: ClipRRect(
// //     borderRadius: BorderRadius.all(Radius.elliptical(5.2, 5.2)),
// //     child: Stack(
// //       children: [
// //         Image.network(item, fit: BoxFit.cover, width: 1000,),
// //         Positioned(
// //           bottom: 0.0,
// //           left: 0.0,
// //           right: 0.0,
// //           child: Container(
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(colors: [
// //                 Color.fromARGB(200, 0, 0, 0),
// //                   Color.fromARGB(150, 0, 0, 0),

// //               ],
// //               begin: Alignment.bottomCenter,
// //               end: Alignment.topCenter)
// //             ),
// //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// //             child: Text ('No. $widget.imageList.indexOf(item)} image', style: TextStyle(
// //               color: Colors.white,
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //             ),),
// //           ),
// //         )
// //       ],
// //     ),
// //   ),

// // )).toList();
    
//   // }
// }

// @override

// class HomeScreen extends StatelessWidget {



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Sidebar(),
//       appBar: AppBar(
//       centerTitle: true,
//       title: const Text(
//         'Unlocking global business opportunities',
//         style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 20),
//       ),
//       backgroundColor: Colors.white,
//       iconTheme: const IconThemeData(color: Colors.black),
//       actions: [
//         IconButton(
//            icon: const Icon(Icons.favorite),
//               onPressed: () {
//               },
//         ),
//         IconButton(
//            icon: const Icon(Icons.business_center),
//               onPressed: () {
//               },
//         ),
//       ],
//     ),
    

//        bottomNavigationBar: MyBottomNavigationBar(),
//          body: SingleChildScrollView(
//         scrollDirection: Axis.vertical, 
//         child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(padding: EdgeInsets.only(right:30, left:30)),
//           const TextField(
//                     cursorColor: Color.fromARGB(24, 158, 158, 158),
//                     decoration: InputDecoration(
//                       fillColor: Color.fromARGB(53, 158, 158, 158),
//                       filled: true,
//                       prefixIcon: Icon(Icons.search),
//                       suffixIcon: Icon(Icons.camera_alt_rounded),
//                       border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(12, 10)),
//                       ),
//                       hintText: 'Search',
//                       hintStyle: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 12
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 60),
//                   Text('Featured buisnesses', 
//                   style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
//                   CarouselSlider(
//                     items: imageList
//                     .map((item) => Container(
//                       child: Center(
//                       child: Image.network(
//                         item,
//                         fit: BoxFit.cover,
//                         width: 1000,
//                       ),
//                     ),
//                     ))
//                     .toList(), 
//                     options: CarouselOptions(
//                       autoPlay: true,
//                       aspectRatio: 2.0,
//                       enlargeCenterPage: true,
//                     )),
//                   // CarouselSlider(
//                   //   items: imageSliders, 
//                   //   options: CarouselOptions(
//                   //     autoPlay: true,
//                   //     enlargeCenterPage: true,
//                   //     aspectRatio: 2.0,
//                   //   )),
//                   //   Row(
//                   //     children: [
//                   //     widget.imageList.map((url){
//                   //         int index = widget.imageList.indexOf(url);
//                   //         return Container(
//                   //           width: 8,
//                   //           height: 8,
//                   //           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3,),
//                   //           decoration: BoxDecoration(
//                   //             shape: BoxShape.circle
//                   //           ),
//                   //         );
//                   //       }),
//                   //     ],
//                   //   ),
//           Container(
            
//             // child: Image.asset("images/events.jpg"),
//             // decoration: BoxDecoration(
//             //   borderRadius: BorderRadius.circular(6)),
              
//             ),  
//             Container(
//               height: 100,
//               child: const SingleChildScrollView(
//                 scrollDirection: Axis.horizontal, // Set the scroll direction to horizontal
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Card(
//                       color: Colors.lightBlueAccent,
//                       child: Text('Construction'),
//                     ),
//                     Card(
//                       color: Colors.amber,
//                       child: Text('Technology'),
//                     ),
//                     Card(
//                       color: Colors.yellow,
//                       child: Text('Agriculture'),
//                     ),

//                       ],
//                     ),
//                      Row(
//                       children: [
//                         Card(
//                       color: Colors.lightBlueAccent,
//                       child: Text('Toursim'),
//                     ),
//                     Card(
//                       color: Colors.amber,
//                       child: Text('Finance'),
//                     ),
//                     Card(
//                       color: Colors.yellow,
//                       child: Text('More'),
//                     ),

//                       ],
//                     )
//                 ],
//               ),
//               ),
//             ),
//             Container(
//               child: Column(
//                 children: [
//                   Card(
//                     child: Image.asset(
//         'images/events.jpg',
//         fit: BoxFit.cover,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       elevation: 5,
//       margin: const EdgeInsets.all(10),
//                   ),
//                   const Card(),
//                 ],
                
//               ),
//             ) 
            
//         ],
        
  
//       ),
//     ),
//     ),
//     );
//   }
// }



    





    //     body: Container(
//       child: Stack(
//         children: [
//           Opacity(opacity: 0.5,
//           child: ClipPath(
//             clipper: WaveClipper(),
//             child: Container(
//               color: Colors.amber,
//               height: 200,
//             ),
//           ),)

//         ],

//       ),
//     ),
//     );
//   }
// }

// class WaveClipper extends CustomClipper<Path> {
//   @override
  // Path getClip(Size size) {
  //   debugPrint(size.width.toString());
  //   var path = new Path();
  //   path.lineTo(0, size.height);
  //   var firstStart = Offset(size.width / 1, size.height - 1);
  //   var firstEnd = Offset(size.width / 1, size.height / -1.0);
  //   path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

  //   var secondStart = Offset((size.width / 2), size.height - 2);
  //   var secondEnd = Offset(size.width /2, size.height - 2);
  //   path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
  //   path.lineTo(size.width, 0);
  //   path.close();
  //   return path;
//   Path getClip(Size size) {
//     var path = Path();
//     path.moveTo(0.0, size.height * 0.34);
//     path.quadraticBezierTo(
//         3 / 4 * size.width, size.height * 0.18, size.width, size.height * 0.05);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0.0, size.height);
//     return path;
  
//   }
  
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }
// }