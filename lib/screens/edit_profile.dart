import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfile> {
  List<String> businessTypes = ['Foreign Business', 'Kenyan Business'];
  String? selectedBusinessType = 'Foreign Business';

  List<String> companySizes = ['Company Size', 'less than 50', '50-100', '100-500', '500-1000+'];
  String? selectedCompanySize = 'Company Size';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Positioned.fill(
          //   child: Container(
          //     decoration: BoxDecoration(
          //       image: DecorationImage(
          //         image: const AssetImage("images/background.jpg"),
          //         fit: BoxFit.cover,
          //         colorFilter: ColorFilter.mode(
          //           Colors.black.withOpacity(0.4),
          //           BlendMode.darken,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        hintText: "Enter your Name",
                        prefixIcon: Icons.person,
                        height: 45,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        hintText: "Phone Number",
                        prefixIcon: Icons.phone,
                        height: 45,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        hintText: "Enter Email",
                        prefixIcon: Icons.email,
                        height: 45,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        hintText: "Profession",
                        prefixIcon: Icons.work,
                        height: 45,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                const Row(
                  children: [
                    Flexible(child:
                    CustomTextField(
                      height: 45,
                      hintText: "Enter Location",
                      prefixIcon: Icons.location_pin,
                    ),
                    ),
                    SizedBox(width: 10),
                    Flexible(child:
                    CustomTextField(
                      height: 45,
                      hintText: "Company Name",
                      prefixIcon: Icons.business,
                    ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        hintText: "Industry",
                        prefixIcon: Icons.business,
                        height: 45,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        hintText: "Company Website",
                        prefixIcon: Icons.public,
                        height: 45,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Company Size',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "<50",
                                      groupValue: selectedCompanySize,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCompanySize = value as String?;
                                        });
                                      },
                                    ),
                                    Text("<50"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "50-100",
                                      groupValue: selectedCompanySize,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCompanySize = value as String?;
                                        });
                                      },
                                    ),
                                    Text("50-100"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "100-500",
                                      groupValue: selectedCompanySize,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCompanySize = value as String?;
                                        });
                                      },
                                    ),
                                    Text("100-500"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      value: "500-1000",
                                      groupValue: selectedCompanySize,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCompanySize = value as String?;
                                        });
                                      },
                                    ),
                                    Text("500-1000+"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Business Type',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: businessTypes.map((type) {
                              return Expanded(
                                child: Row(
                                  children: [
                                    Radio(
                                      value: type,
                                      groupValue: selectedBusinessType,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedBusinessType = value as String?;
                                        });
                                      },
                                    ),
                                    Text(type),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40, width: 365,),
                // CustomTextField(
                //   hintText: "Enter Password",
                //   prefixIcon: Icons.lock,
                //   height: 45,
                //   isPassword: true,
                // ),

                const SizedBox(height: 35),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 205,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle sign-up logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Save changes',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.height = 50,
    this.isPassword = false,
  }) : super(key: key);

  final String hintText;
  final IconData prefixIcon;
  final double height;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: TextField(
        textAlign: TextAlign.center,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(isPassword ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    // Toggle password visibility
                  },
                )
              : null,
          hintText: hintText,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class UserModel {
//   final String name;
//   final String phone;
//   final String email;
//   final String profession;
//   final String location;
//   final String companyName;
//   final String industry;
//   final String companyWebsite;
//   final String businessType;
//   final String companySize;

//   UserModel({
//     required this.name,
//     required this.phone,
//     required this.email,
//     required this.profession,
//     required this.location,
//     required this.companyName,
//     required this.industry,
//     required this.companyWebsite,
//     required this.businessType,
//     required this.companySize,
//   });
// }

// class EditProfile extends StatefulWidget {
//   const EditProfile({Key? key}) : super(key: key);

//   @override
//   _EditProfileState createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController professionController = TextEditingController();
//   final TextEditingController locationController = TextEditingController();
//   final TextEditingController companyNameController = TextEditingController();
//   final TextEditingController industryController = TextEditingController();
//   final TextEditingController websiteController = TextEditingController();
  
//   String selectedBusinessType = 'Foreign Business';
//   String selectedCompanySize = 'Company Size';

//   List<String> businessTypes = ['Foreign Business', 'Kenyan Business'];

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _getUserData(),
//       builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }

//         if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }

//         Map<String, dynamic> userData = snapshot.data ?? {};

//         nameController.text = userData['name'];
//         phoneController.text = userData['phone'];
//         emailController.text = userData['email'];
//         professionController.text = userData['profession'];
//         locationController.text = userData['location'];
//         companyNameController.text = userData['companyName'];
//         industryController.text = userData['industry'];
//         websiteController.text = userData['companyWebsite'];
//         selectedBusinessType = userData['businessType'];
//         selectedCompanySize = userData['companySize'];

//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Edit Profile'),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   // Your TextFormField widgets here...

//                   SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () {
//                       updateProfile();
//                     },
//                     child: Text('Save Changes'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Future<Map<String, dynamic>> _getUserData() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       DocumentSnapshot<Map<String, dynamic>> snapshot =
//           await _firestore.collection('users').doc(user.uid).get();
//       return snapshot.data() ?? {};
//     } else {
//       throw Exception("User not authenticated");
//     }
//   }

//   Future<void> updateProfile() async {
//     try {
//       User? user = _auth.currentUser;
//       if (user != null) {
//         await _firestore.collection('users').doc(user.uid).update({
//           'name': nameController.text,
//           'phone': phoneController.text,
//           'email': emailController.text,
//           'profession': professionController.text,
//           'location': locationController.text,
//           'companyName': companyNameController.text,
//           'industry': industryController.text,
//           'companyWebsite': websiteController.text,
//           'businessType': selectedBusinessType,
//           'companySize': selectedCompanySize,
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Profile updated successfully')),
//         );
//       }
//     } catch (e) {
//       print('Error updating profile: $e');
//     }
//   }
// }
