// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:prime_marketlink/screens/review_form.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
  
// final CollectionReference users = FirebaseFirestore.instance.collection('users');


// File? _image;

//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future<String?> uploadImage(File image) async {
//     try {
//       FirebaseStorage storage = FirebaseStorage.instance;
//       Reference storageReference = storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
//       UploadTask uploadTask = storageReference.putFile(image);
//       TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

//       String downloadUrl = await taskSnapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print("Error uploading image: $e");
//       return null;
//     }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Profile",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: StreamBuilder(
//           stream: users.doc(FirebaseAuth.instance.currentUser?.uid).snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator()); // Show loading indicator while data is being fetched
//             }

//             if (snapshot.hasError) {
//               return Center(child: Text("Error: ${snapshot.error}"));
//             }

//             if (!snapshot.hasData || !snapshot.data!.exists) {
//               return const Center(child: Text("User not found"));
//             }
          
//             // Access user data from the snapshot
//             Map<String, dynamic>? userData = snapshot.data!.data() as Map<String, dynamic>?;
//             return Column(
//               children: [
//                 const SizedBox(height: 10),
//                Column(
//                   children: [
                    
//                     CircleAvatar(
//                     radius: 65,
//                     backgroundImage: _image != null
//                         ? FileImage(_image!) // Use Image.file for FileImage
//                         : const AssetImage("images/avatar.png") as ImageProvider, // Cast to ImageProvider
//                   ),

  
//                     Positioned(
//                       child: IconButton(
//                         onPressed: () async {
//                         await pickImage();
//                         if (_image != null) {
//                           String? downloadUrl = await uploadImage(_image!);
//                           if (downloadUrl != null) {
//                             print("Image uploaded. Download URL: $downloadUrl");
//                           } else {
//                             print("Failed to upload image.");
//                           }
//                         }
//                       },
//                         icon: const Icon(Icons.add_a_photo)
//                         ),
//                         bottom: -10,
//                         left: 80,
//                         ),
//                     // Container(
//                     //   margin: EdgeInsets.only(left: 10),
//                     //   width: 100,
//                     //   height: 50,
//                     //   child: ElevatedButton(
//                     //     onPressed: () {},
//                     //     style: ButtonStyle(
//                     //       backgroundColor: MaterialStateProperty.all(
//                     //         Colors.black,
//                     //       ),
//                     //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     //         RoundedRectangleBorder(
//                     //           borderRadius: BorderRadius.circular(10.0),
//                     //         ),
//                     //       ),
//                     //     ),
//                     //     child: const Text('upload photo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
//                     //   ),
//                     // ),
//                     // Container(
//                     //   margin: EdgeInsets.only(left: 10),
//                     //   width: 100,
//                     //   height: 50,
//                     //   child: ElevatedButton(
//                     //     onPressed: () {},
//                     //     style: ButtonStyle(
//                     //       backgroundColor: MaterialStateProperty.all(
//                     //         Colors.black,
//                     //       ),
//                     //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     //         RoundedRectangleBorder(
//                     //           borderRadius: BorderRadius.circular(10.0),
//                     //         ),
//                     //       ),
//                     //     ),
//                     //     child: const Text('remove photo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
//                     //   ),
//                     // ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.amber,
//                         child: Container(
//                           width: 120,
//                           height: 45,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.circular(9.9),
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.only(left: 20, top: 4, right: 20),
//                             child: Text('Successful connections', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Card(
//                       color: Colors.amber,
//                       child: Container(
//                         width: 60,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(9.9),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.only(left: 20, top: 10, right: 20),
//                           child: Text('0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 20),
//                     const Text('Edit Profile'),
//                     IconButton(
//                       icon: const Icon(Icons.edit),
//                       onPressed: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(builder: (context) => CompanyInfo()),
//                         // );
//                       },
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Name: ${userData?["name"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Email: ${userData?["email"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Phone Number: ${userData?["phone"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Profession: ${userData?["profession"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.zero,
//                     ),
//                     color: Colors.teal,
//                     child: Container(
//                       width: 400,
//                       height: 100,
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                         child: Text('About me: ${userData?["aboutMe"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Company Name: ${userData?["companyName"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Location: ${userData?["location"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Type of Business: ${userData?["businessType"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Company Size: ${userData?["companySize"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Industry: ${userData?["industry"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Card(
//                         shape: const RoundedRectangleBorder(
//                           borderRadius: BorderRadius.zero,
//                         ),
//                         color: Colors.teal,
//                         child: Container(
//                           width: 180,
//                           height: 50,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//                             child: Text('Company Website URL: ${userData?["companyWebsite"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => CustomerReviewsPage()),
//                     );
//                   },
//                   child: Card(
//                     color: Colors.amber,
//                     child: Container(
//                       width: 120,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.rectangle,
//                         borderRadius: BorderRadius.circular(9.9),
//                       ),
//                       child: const Padding(
//                         padding: EdgeInsets.only(left: 35, top: 10, right: 20),
//                         child: Text('Rate Us', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//         },

//       ),
//     ),
//     );
  
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Profile(),
//     );
//   }
// }




import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prime_marketlink/screens/connect_users.dart';
import 'package:prime_marketlink/screens/edit_profile.dart';
import 'package:prime_marketlink/screens/review_form.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';


class Profile extends StatefulWidget {
  final UserProfile userProfile;
   // Add this line



  const Profile({super.key, required this.userProfile, });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
final CollectionReference users = FirebaseFirestore.instance.collection('users');


File? _image;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> uploadImage(File image) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference storageReference = storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask = storageReference.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          stream: users.doc(widget.userProfile.uid).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator()); // Show loading indicator while data is being fetched
            }

            if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Center(child: Text("User not found"));
            }
          
            // Access user data from the snapshot
            Map<String, dynamic>? userData = snapshot.data!.data() as Map<String, dynamic>?;
            return Column(
              children: [
                const SizedBox(height: 10),
               Column(
                  children: [
                    
                    CircleAvatar(
                    radius: 65,
                    backgroundImage: _image != null
                        ? FileImage(_image!) // Use Image.file for FileImage
                        : const AssetImage("images/avatar.png") as ImageProvider, // Cast to ImageProvider
                  ),

  
                    Positioned(
                      bottom: -10,
                        left: 80,
                      child: IconButton(
                        onPressed: () async {
                        await pickImage();
                        if (_image != null) {
                          String? downloadUrl = await uploadImage(_image!);
                          if (downloadUrl != null) {
                            print("Image uploaded. Download URL: $downloadUrl");
                          } else {
                            print("Failed to upload image.");
                          }
                        }
                      },
                        icon: const Icon(Icons.add_a_photo)
                        ),
                        ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 10),
                    //   width: 100,
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all(
                    //         Colors.black,
                    //       ),
                    //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10.0),
                    //         ),
                    //       ),
                    //     ),
                    //     child: const Text('upload photo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 10),
                    //   width: 100,
                    //   height: 50,
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all(
                    //         Colors.black,
                    //       ),
                    //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    //         RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10.0),
                    //         ),
                    //       ),
                    //     ),
                    //     child: const Text('remove photo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    //   ),
                    // ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        shape: const RoundedRectangleBorder(
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
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20, top: 4, right: 20),
                            child: Text('Successful connections', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                          child: Text('0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text('Edit Profile'),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EditProfile()),
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
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Name: ${userData?["name"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Email: ${userData?["email"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
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
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Phone Number: ${userData?["phone"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Profession: ${userData?["profession"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    color: Colors.teal,
                    child: SizedBox(
                      width: 400,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Text('About me: ${userData?["aboutMe"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Company Name: ${userData?["companyName"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Location: ${userData?["location"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Type of Business: ${userData?["businessType"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Company Size: ${userData?["companySize"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Industry: ${userData?["industry"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.teal,
                        child: SizedBox(
                          width: 180,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: Text('Company Website URL: ${userData?["companyWebsite"] ?? ""}', style: const TextStyle(fontSize: 12, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                      child: const Padding(
                        padding: EdgeInsets.only(left: 35, top: 10, right: 20),
                        child: Text('Rate Us', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileListPage()
    );
  }
}

