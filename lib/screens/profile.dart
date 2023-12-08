// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:prime_marketlink/models/user.dart';
// import 'package:prime_marketlink/screens/basic_info.dart';
// import 'package:prime_marketlink/screens/company_info.dart';
// import 'package:prime_marketlink/screens/review_form.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Profile extends StatefulWidget {
//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {

//   // Initialize a reference to the User collection
//   CollectionReference users = FirebaseFirestore.instance.collection('Users');

//   // Function to get user data from Firestore
//   Future<void> getUserData() async {
//     try {
//       // Get the current user
//       User? currentUser = FirebaseAuth.instance.currentUser;

//       if (currentUser != null) {
//         // Use the UID from the current user
//         String userId = currentUser.uid;

//         // Get the document snapshot for the user
//         DocumentSnapshot userSnapshot = await users.doc(userId).get();

//         // Access the data from the snapshot
//         Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

//         // Now you can use the userData to populate your UI or perform other tasks
//         print("User Data: $userData");
//       } else {
//         print("No current user");
//       }
//     } catch (e) {
//       print("Error getting user data: $e");
//     }
//   }







//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile", style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.teal,
//       ),
    
      
//     body: SingleChildScrollView(
//         scrollDirection: Axis.vertical, 
//         child: Stack(
//         children: [      
//        Column(
//           children: [
//             SizedBox(height: 10,),
//             Row(
//               children: [
//                 Padding(
//                  padding: const EdgeInsets.all(10.0),
//                 child: CircleAvatar(
//                   radius: 60,
//                   backgroundImage: AssetImage("images/business-woman.jpg"),

//                 ),),
//                   Container(
//                   margin: EdgeInsets.only(left: 10),
//                   width: 130,
//                   height: 50,
//                 child: ElevatedButton(
//                     onPressed: () {
                      
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                         Colors.black,
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                     child: const Text('upload photo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
//                   ),
//                   ),
//                   Container(
//                   margin: EdgeInsets.only(left: 10),
//                   width: 100,
//                   height: 50,
//                 child: ElevatedButton(
//                     onPressed: () {
                      
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(
//                         Colors.black,
//                       ),
//                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                     ),
//                     child: const Text('remove photo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),),
//                   ),
//                   ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                   Text('Edit Personal info'),
//                IconButton(
//                   icon: const Icon(Icons.edit),
//                   onPressed: () {
//                     // Navigate to the desired page when the button is pressed
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PersonalDetails()),
//                     );
//                   },
//                 ),

                
//               ],
//             ),
//                Row(
//               children: [
//                 Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Card(
//                 color: Colors.amber,
//                 child: Container(
//                   width: 120,
//                height: 45,
//                decoration: BoxDecoration(
//                 shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
//               ),
//               child: Padding(padding: EdgeInsets.only(left: 20, top: 4, right: 20),
//                 child: const Text('Successful connections', style: TextStyle( fontSize: 12, fontWeight: FontWeight.bold)),
//               ),
//                         ),
//                 ),
//                 ),
                
//                 Card(
//                 color: Colors.amber,
//                 child: Container(
//                   width: 60,
//                height: 40,
//                decoration: BoxDecoration(
//                 shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
//               ),
//               child: Padding(padding: EdgeInsets.only(left: 20, top: 10, right: 20),
//                 child: const Text('0', style: TextStyle( fontSize: 12, fontWeight: FontWeight.bold)),
//               ),
//                         ),
//                 ),
//                 SizedBox(width: 20,),
//                 Text('Edit Company info'),
//                 IconButton(
//                   icon: const Icon(Icons.edit),
//                   onPressed: () {
//                     // Navigate to the desired page when the button is pressed
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Companyinfo()),
//                     );
//                   },
//                 ),
              

//               ],
//             ),
            
//             Row(
//               children: [

//                Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Name', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only( left: 10),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Email', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                )
//               ],
//             ),
            



//              Row(
//               children: [

//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Phone Number', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only( left: 10),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Profession', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                )
//               ],
//             ),
//             SizedBox(height: 10),
//             Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 400,
//                     height: 100,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('About me', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                ),
          
//            SizedBox(height: 10,),
//             Row(
//               children: [

//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Company Name', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only( left: 10),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Location', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                )
//               ],
//             ),
//             SizedBox(height: 10,),
//            Row(
//               children: [

//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Type of Business', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only( left: 10),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Company Size', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                )
//               ],
//             ),
//             SizedBox(height: 10,),
//             Row(
//               children: [

//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Industry', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only( left: 10),
//                  child: Card(
//                  shape: RoundedRectangleBorder(
//                              borderRadius: BorderRadius.zero,
//                            ),
//                   color: Colors.teal,
//                   child: Container(
//                     width: 180,
//                     height: 50,
//                     child: Padding(padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    
//                     child: Text('Company Website URL', style: TextStyle(fontSize: 12,color: Colors.white),),)
                            
//                   ),
//                  ),
//                )
//               ],
//             ),
//             SizedBox(height: 30,),
//             GestureDetector(
//               onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => CustomerReviewsPage()),
//             );
//           },
//           child: Card(
//             color: Colors.amber,
//             child: Container(
//                   width: 120,
//                height: 40,
//                decoration: BoxDecoration(
//                 shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
//               ),
//               child: Padding(padding: EdgeInsets.only(left: 35, top: 10, right: 20),
//                 child: const Text('Rate Us', style: TextStyle( fontSize: 12, fontWeight: FontWeight.bold)),
//               ),
//               ),
            

//            ) ,

//             ),
          
//           ],
//         ),
      
//         ],
//     ),
//     )
            
      
//       );
    
//   }
// }



import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prime_marketlink/screens/basic_info.dart';
import 'package:prime_marketlink/screens/company_info.dart';
import 'package:prime_marketlink/screens/review_form.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
final CollectionReference users = FirebaseFirestore.instance.collection('users');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder(
          stream: users.doc(FirebaseAuth.instance.currentUser?.uid).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator()); // Show loading indicator while data is being fetched
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text("User not found"));
            }
          
            // Access user data from the snapshot
            Map<String, dynamic>? userData = snapshot.data!.data() as Map<String, dynamic>?;
            return Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("images/business-woman.jpg"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black,
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: const Text('upload photo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 100,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black,
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        child: const Text('remove photo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Edit Personal info'),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PersonalDetails()),
                        );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.amber,
                        child: Container(
                          width: 120,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(9.9),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, top: 4, right: 20),
                            child: const Text('Successful connections', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.amber,
                      child: Container(
                        width: 60,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(9.9),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                          child: const Text('0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text('Edit Company info'),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => CompanyInfo()),
                        // );
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Name: ${userData?["name"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Email: ${userData?["email"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Phone Number: ${userData?["phone"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Profession: ${userData?["profession"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    color: Colors.teal,
                    child: Container(
                      width: 400,
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text('About me: ${userData?["aboutMe"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Company Name: ${userData?["companyName"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Location: ${userData?["location"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Type of Business: ${userData?["businessType"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Company Size: ${userData?["companySize"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Industry: ${userData?["industry"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: Container(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Company Website URL: ${userData?["companyWebsite"] ?? ""}', style: TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CustomerReviewsPage()),
                    );
                  },
                  child: Card(
                    color: Colors.amber,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(9.9),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 35, top: 10, right: 20),
                        child: const Text('Rate Us', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            );
        },

      ),
    ),
    );
  
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profile(),
    );
  }
}
