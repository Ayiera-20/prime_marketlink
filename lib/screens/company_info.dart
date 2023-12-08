// import 'package:flutter/material.dart';
// import 'package:prime_marketlink/screens/profile.dart';  
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// class CompanyInfo extends StatefulWidget {
//   @override
//   _CompanyInfoState createState() => _CompanyInfoState();
// }

// class _CompanyInfoState extends State<CompanyInfo> {
//   static const mySnackBar = SnackBar(content: Text('Saved Successfully'));

//   FirebaseAuth _auth = FirebaseAuth.instance; 
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   List<String> items = ['Foreign Business', 'Kenyan Business'];
//   TextEditingController businessTypeController = TextEditingController();
//   String? selectedItem = 'Foreign Business';

//   List<String> itemsList1 = ['Company Size', 'less than 50', '50-100', '100-500', '500-1000'];
//   TextEditingController companySizeController = TextEditingController();
//   String? selectedItemList1 = 'Company Size';

//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController aboutMeController = TextEditingController();
//   final TextEditingController companyNameController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();
//   final TextEditingController industryController = TextEditingController();
//   final TextEditingController websiteController = TextEditingController();

  

//   Future<void> saveDataToFirestore() async {
//   try {
//     // Get the current user
//     User? user = _auth.currentUser;

//     if (user != null) {
//       // Access the Firestore instance
//       String userId = user.uid;

//       // Create a reference to the user's document in the 'users' collection
//       DocumentReference userRef = _firestore.collection('Users').doc(userId);

//       // Update the document with the new data
//       await userRef.set({
//         'profession': professionController.text,
//         'aboutMe': aboutMeController.text,
//         'companyName': companyNameController.text,
//         'location': locationController.text,
//         'businessType': businessTypeController.text,
//         'companySize': companySizeController.text,
//         'industry': industryController.text,
//         'website': websiteController.text,
//       });

//       // Show a success message
//       ScaffoldMessenger.of(context).showSnackBar(mySnackBar);

//       // Navigate to the profile screen
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => Profile(),
//       ));
//     }
//   } catch (e) {
//     // Handle errors
//     print('Error saving data to Firestore: $e');
//     // You may want to show an error message to the user
//   }
// }



  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text('Fill your company information'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//              TextField(
//               controller: professionController,
//               decoration: InputDecoration(
//                 labelText: 'Profession',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//                TextField(
//               controller: aboutMeController,
//               decoration: InputDecoration(
//                 labelText: 'About Me',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: companyNameController,
//               decoration: InputDecoration(
//                 labelText: 'Company Name',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0), 

//             TextField(
//               controller: locationController,
//               decoration: InputDecoration(
//                 labelText: 'Location',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 ),
//               ),
//             ),
//              Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 DropdownButton<String>(
//                   value: selectedItem,
//                   items: items.map((item) {
//                     return DropdownMenuItem<String>(
//                       value: item,
//                       child: Text(item, style: TextStyle(
//                         color: Colors.white, 
//                         fontSize: 16, 
//                       ),
//                     ),
//                     );
//                   }).toList(),
//                   onChanged: (item) {
//                     setState(String? newValue) {
//                       selectedItem = item;
//                        businessTypeController.text = item ?? '';
//                     };
//                   },
//                   icon: Icon(
//                   Icons.arrow_drop_down,
//                   color: Colors.white, 
//                 ),
//                 iconSize: 24,
//                 underline: Container(
//                   height: 2,
//                   color: Colors.white, 
//                 ),
//                 ),
//               DropdownButton<String>(
//               value: selectedItemList1,
//               items: itemsList1.map((String item) {
//                 return DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(
//                     item,
//                     style: TextStyle(
//                       color: Colors.white, 
//                       fontSize: 16, 
//                     ),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (String? newValue) {
//                 if (newValue != null) {
//                    companySizeController.text = newValue;
//                   print('Selected Item List 1: $selectedItemList1');
//                 }
//               },
//               icon: Icon(
//                 Icons.arrow_drop_down,
//                 color: Colors.white, 
//               ),
//               iconSize: 24,
//               underline: Container(
//                 height: 2,
//                 color: Colors.white,
//               ),
//             ),

//                           ],
//             ),

//             TextField(
//               controller: industryController,
//               decoration: InputDecoration(
//                 labelText: 'Industry',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: websiteController,
//               decoration: InputDecoration(
//                 labelText: 'Company Website URL',
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//            SizedBox(
//               width: 200,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   saveDataToFirestore();
//                   ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder: (context) => Profile(),
//       ));
//                     },
//                 style: ButtonStyle(
//       //             shape: RoundedRectangleBorder(
//       // borderRadius: BorderRadius.circular(20.0),
                  
//                   backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 221, 181, 49)),
//                   textStyle: const MaterialStatePropertyAll(TextStyle(color: Colors.black)),
                  
//                 ),
//                 clipBehavior: Clip.antiAlias,
//                 child: const Text('Update'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:prime_marketlink/screens/profile.dart';  
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class CompanyInfo extends StatefulWidget {
//   @override
//   _CompanyInfoState createState() => _CompanyInfoState();
// }

// class _CompanyInfoState extends State<CompanyInfo> {
//   static const mySnackBar = SnackBar(content: Text('Saved Successfully'));

//   FirebaseAuth _auth = FirebaseAuth.instance; 
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // List<String> items = ['Foreign Business', 'Kenyan Business'];
  // TextEditingController businessTypeController = TextEditingController();
  // String? selectedItem = 'Foreign Business';

  // List<String> itemsList1 = ['Company Size', 'less than 50', '50-100', '100-500', '500-1000'];
  // TextEditingController companySizeController = TextEditingController();
  // String? selectedItemList1 = 'Company Size';

  

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: getUserDataStream(),
//       builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }

//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }

//         Map<String, dynamic> userData = snapshot.data?.data() as Map<String, dynamic>? ?? {};

//         return Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             title: Text('Fill your company information'),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextField(
//                   controller: professionController..text = userData['profession'] ?? '',
//                   decoration: InputDecoration(
//                     labelText: 'Profession',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextField(
//                   controller: aboutMeController..text = userData['aboutMe'] ?? '',
//                   decoration: InputDecoration(
//                     labelText: 'About Me',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextField(
//                   controller: companyNameController..text = userData['companyName'] ?? '',
//                   decoration: InputDecoration(
//                     labelText: 'Company Name',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextField(
//                   controller: locationController..text = userData['location'] ?? '',
//                   decoration: InputDecoration(
//                     labelText: 'Location',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //    Container(
                //       decoration: BoxDecoration(
                //         color: Colors.white, // Set the background color here
                //       ),
                //       child: DropdownButton<String>(
                //         value: selectedItem,
                //         items: items.map((item) {
                //           return DropdownMenuItem<String>(
                //             value: item,
                //             child: Text(
                //               item,
                //               style: TextStyle(
                //                 color: Colors.blue,
                //                 fontSize: 16,
                //               ),
                //             ),
                //           );
                //         }).toList(),
                //         onChanged: (item) {
                //           setState(() {
                //             selectedItem = item;
                //             businessTypeController.text = item ?? '';
                //             print('Selected Item : $selectedItem');
                //           });
                //         },
                //         icon: Icon(
                //           Icons.arrow_drop_down,
                //           color: Colors.black,
                //         ),
                //         iconSize: 24,
                //         underline: Container(
                //           height: 2,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //     SizedBox(width: 10,),
                //     Container(
                //       decoration: BoxDecoration(
                //         color: Colors.white, // Set the background color here
                //       ),
                //       child: DropdownButton<String>(
                //         elevation: 6,
                //         value: selectedItemList1,
                //         items: itemsList1.map((String item) {
                //           return DropdownMenuItem<String>(
                //             value: item,
                //             child: Text(
                //               item,
                //               style: TextStyle(
                //                 color: Colors.blue,
                //                 fontSize: 16,
                //               ),
                //             ),
                //           );
                //         }).toList(),
                //        onChanged: (String? newValue) {
                //           if (newValue != null) {
                //             setState(() {
                //               selectedItemList1 = newValue;
                //               companySizeController.text = newValue;
                //               print('Selected Item List 1: $selectedItemList1');
                //             });
                //           }
                //         },
                //         icon: Icon(
                //           Icons.arrow_drop_down,
                //           color: Colors.black,
                //         ),
                //         iconSize: 24,
                //         underline: Container(
                //           height: 2,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),

                //                       ],
                //                     ),
//                  SizedBox(height: 16.0),
//                 TextField(
//                   controller: industryController..text = userData['industry'] ?? '',
//                   decoration: InputDecoration(
//                     labelText: 'Industry',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextField(
//                   controller: websiteController..text = userData['website'] ?? '',
//                   decoration: InputDecoration(
//                     labelText: 'Company Website URL',
//                     filled: true,
//                     fillColor: Colors.white,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 SizedBox(
//                   width: 200,
//                   height: 50,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       await saveDataToFirestore();
//                       ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (context) => Profile(),
//                         ),
//                       );
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 221, 181, 49)),
//                       textStyle: MaterialStateProperty.all(TextStyle(color: Colors.black)),
//                     ),
//                     clipBehavior: Clip.antiAlias,
//                     child: const Text('Update'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Stream<DocumentSnapshot> getUserDataStream() {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       return _firestore.collection('Users').doc(user.uid).snapshots();
//     }
//     throw Exception("User not authenticated");
//   }

//   Future<void> saveDataToFirestore() async {
//     try {
//       User? user = _auth.currentUser;

//       if (user != null) {
//         String userId = user.uid;
//         DocumentReference userRef = _firestore.collection('company_info').doc(userId);

//         await userRef.set({
//           'profession': professionController.text,
//           'aboutMe': aboutMeController.text,
//           'companyName': companyNameController.text,
//           'location': locationController.text,
//           'businessType': businessTypeController.text,
//           'companySize': companySizeController.text,
//           'industry': industryController.text,
//           'website': websiteController.text,
//         });
//       } else {
//         throw Exception("User not authenticated");
//       }
//     } catch (e) {
//       print('Error saving data to Firestore: $e');
//       rethrow;
//     }
//   }
// }
