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
        currentIndex: 4,
        onTabSelected: (index) {},
        userProfile: UserProfile(
          uid: FirebaseAuth.instance.currentUser!.uid,
          displayName: FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfile()),
              );
            },
          ),
        ],
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
            return SingleChildScrollView(
              child: Column(
              children: [
                // Profile Header Section
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.teal, Colors.teal.shade700],
                    ),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 56,
                              backgroundImage: _image != null
                                  ? FileImage(_image!)
                                  : const AssetImage("assets/images/avatar.avif") as ImageProvider,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                onPressed: () async {
                                  await pickImage();
                                  if (_image != null) {
                                    String? downloadUrl = await uploadImage(_image!);
                                    if (downloadUrl != null) {
                                      print("Image uploaded. Download URL: $downloadUrl");
                                    }
                                  }
                                },
                                icon: const Icon(Icons.camera_alt, size: 20, color: Colors.teal),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        userData?["name"] ?? "User Name",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        userData?["profession"] ?? "Profession",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Stats Card
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem('Connections', '0', Icons.people_outline),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      _buildStatItem('Posts', '0', Icons.article_outlined),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      _buildStatItem('Reviews', '0', Icons.star_outline),
                    ],
                  ),
                ),

                // Personal Information Section
                _buildSection(
                  'Personal Information',
                  [
                    _buildInfoCard('Email', userData?["email"] ?? "", Icons.email_outlined),
                    _buildInfoCard('Phone', userData?["phone"] ?? "", Icons.phone_outlined),
                    _buildInfoCard('Location', userData?["location"] ?? "", Icons.location_on_outlined),
                  ],
                ),

                // About Section
                if (userData?["aboutMe"] != null && userData?["aboutMe"] != "")
                  _buildSection(
                    'About',
                    [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          userData?["aboutMe"] ?? "",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),

                // Company Information Section
                _buildSection(
                  'Company Information',
                  [
                    _buildInfoCard('Company', userData?["companyName"] ?? "", Icons.business_outlined),
                    _buildInfoCard('Industry', userData?["industry"] ?? "", Icons.category_outlined),
                    _buildInfoCard('Business Type', userData?["businessType"] ?? "", Icons.business_center_outlined),
                    _buildInfoCard('Company Size', userData?["companySize"] ?? "", Icons.group_outlined),
                    _buildInfoCard('Website', userData?["companyWebsite"] ?? "", Icons.language_outlined),
                  ],
                ),

                // Actions
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CustomerReviewsPage()),
                        );
                      },
                      icon: const Icon(Icons.rate_review_outlined),
                      label: const Text('Rate & Review'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black87,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
            );
        },

      ),
    ),
    );
  
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, IconData icon) {
    if (value.isEmpty) return const SizedBox.shrink();
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.teal, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
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

