
// import 'package:flutter/material.dart';

// import 'package:prime_marketlink/controllers/signUpController.dart';
// import 'package:prime_marketlink/screens/home_screen.dart';
// import 'package:prime_marketlink/screens/login.dart';



// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final SignupController _controller = SignupController();

//     List<String> items = ['Foreign Business', 'Kenyan Business'];
//   TextEditingController businessTypeController = TextEditingController();
//   String? selectedItem = 'Foreign Business';

//   List<String> itemsList1 = ['Company Size', 'less than 50', '50-100', '100-500', '500-1000'];
//   TextEditingController companySizeController = TextEditingController();
//   String? selectedItemList1 = 'Company Size';

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text("Sign Up"),
//         backgroundColor: Colors.white,
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: const AssetImage("images/background.jpg"),
//                   fit: BoxFit.cover,
//                   colorFilter: ColorFilter.mode(
//                     Colors.black.withOpacity(0.4),
//                     BlendMode.darken,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.all(15.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Welcome to Prime Market Link',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 30),
//                 Row(
//                   children: [
//                     Flexible(child: 
//                     CustomTextField(
//                       controller: _controller.nameController,
//                       hintText: "Enter your Name",
//                       prefixIcon: Icons.person,
//                     ),),
//                    const SizedBox(width: 10),
//                    Flexible(child: 
//                     CustomTextField(
//                       controller: _controller.phoneController,
//                       hintText: "Enter Phone Number",
//                       prefixIcon: Icons.phone,
//                     ),
//                     )
                    
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 Row(
//                   children: [
//                     Flexible(child:
                  
//                     CustomTextField(
//                       controller: _controller.emailController,
//                       hintText: "Enter Email",
//                       prefixIcon: Icons.email,
//                     ), ),
//                     const SizedBox(width: 10),
//                     Flexible(child: 
//                     CustomTextField(
//                   controller: _controller.professionController,
//                   hintText: "Profession",
//                   prefixIcon: Icons.work,
//                 ),
//                     ),
//                   ],
//                 ),
//                  const SizedBox(height:30),
                // Row(
                //   children: [
                //      Flexible(child: 
                //     CustomTextField(
                //   controller: _controller.locationController,
                //   hintText: "Enter Location",
                //   prefixIcon: Icons.location_pin,
                // ),
                //     ),
                //      const SizedBox(width: 10),
                //      Flexible(child: 
                //     CustomTextField(
                //   controller: _controller.companyNameController,
                //   hintText: "Enter Company Name",
                //   prefixIcon: Icons.business,
                // ),
                //     ),
                //   ],
                // ),
//                 const SizedBox(height: 30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Flexible(child: 
//                    Container(
//                     width: 180,
//                       decoration: const BoxDecoration(
//                         color: Colors.white, // Set the background color here
//                       ),
//                       child: DropdownButton<String>(
//                         value: selectedItem,
//                         items: items.map((item) {
//                           return DropdownMenuItem<String>(
//                             value: item,
//                             child: Text(
//                               item,
//                               style: const TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                         onChanged: (item) {
//                           setState(() {
//                             selectedItem = item;
//                             businessTypeController.text = item ?? '';
//                             print('Selected Item : $selectedItem');
//                           });
//                         },
//                         icon: const Icon(
//                           Icons.arrow_drop_down,
//                           color: Colors.black,
//                         ),
//                         iconSize: 24,
//                         underline: Container(
//                           height: 2,
//                           color: Colors.black,
//                         ),
//                       )),
//                     ),
//                     const SizedBox(width: 10,),
//                     Flexible(child: 
//                     Container(
//                       width: 180,
//                       decoration: const BoxDecoration(
//                         color: Colors.white, // Set the background color here
//                       ),
//                       child: DropdownButton<String>(
//                         elevation: 6,
//                         value: selectedItemList1,
//                         items: itemsList1.map((String item) {
//                           return DropdownMenuItem<String>(
//                             value: item,
//                             child: Text(
//                               item,
//                               style: const TextStyle(
//                                 color: Colors.blue,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           );
//                         }).toList(),
//                        onChanged: (String? newValue) {
//                           if (newValue != null) {
//                             setState(() {
//                               selectedItemList1 = newValue;
//                               companySizeController.text = newValue;
//                               print('Selected Item List 1: $selectedItemList1');
//                             });
//                           }
//                         },
//                         icon: const Icon(
//                           Icons.arrow_drop_down,
//                           color: Colors.black,
//                         ),
//                         iconSize: 24,
//                         underline: Container(
//                           height: 2,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),),

//                                       ],
//                                     ),
//                  const SizedBox(height: 30),
//                 Row(
//                   children: [
//                      Flexible(child: 
//                     CustomTextField(
//                   controller: _controller.industryController,
//                   hintText: "Industry",
//                   prefixIcon: Icons.business,
//                 ),
//                     ),
//                      const SizedBox(width: 10),
//                      Flexible(child: 
//                     CustomTextField(
//                   controller: _controller.websiteController,
//                   hintText: "Company Website URL",
//                   prefixIcon: Icons.web,
//                 ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 30),
//                 CustomTextField(
//                       controller: _controller.passwordController,
//                       hintText: "Enter Password",
//                       prefixIcon: Icons.lock,
//                       obscureText: true,
//                       suffixIcon: Icons.remove_red_eye,
//                     ),
                
//                 const SizedBox(height: 50),
                // Container(
                //   margin: const EdgeInsets.only(left: 10, right: 10),
                //   width: 365,
                //   height: 50,
                // child: ElevatedButton(
                //   onPressed: () {
                //     _controller.signUp(context);
                //   },
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.teal,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //   ),
                //   child: const Text(
                //     'Sign Up',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontWeight: FontWeight.bold,
                //       fontSize: 18,
                //     ),
                //   ),
                // ),),
//                 const SizedBox(height: 30),
//                 const Text(
//                   'Already have an account?',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     _controller.navigateToLogin(context);
//                   },
//                   child: const Text(
//                     'Login Here',
//                     style: TextStyle(color: Color(0xFF8FF2F7)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.prefixIcon,
//     this.obscureText = false,
//     this.suffixIcon,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final String hintText;
//   final IconData prefixIcon;
//   final bool obscureText;
//   final IconData? suffixIcon;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       textAlign: TextAlign.center,
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         prefixIcon: Icon(prefixIcon),
//         suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
//         hintText: hintText,
//         filled: true,
//         fillColor: Colors.white,
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:prime_marketlink/controllers/signUpController.dart';
import 'package:prime_marketlink/screens/home_screen.dart';
import 'package:prime_marketlink/screens/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;
  final SignupController _controller = SignupController();

  List<String> businessTypes = ['Foreign Business', 'Kenyan Business'];
  String? selectedBusinessType = 'Foreign Business';

  List<String> companySizes = ['Company Size', 'less than 50', '50-100', '100-500', '500-1000+'];
  String? selectedCompanySize = 'Company Size';


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Sign Up"),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/background.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Prime Market Link',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        controller: _controller.nameController,
                        hintText: "Enter your Name",
                        prefixIcon: Icons.person,
                        height: 45,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        controller: _controller.phoneController,
                        hintText: "Phone Number",
                        prefixIcon: Icons.phone,
                        height: 45,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        controller: _controller.emailController,
                        hintText: "Enter Email",
                        prefixIcon: Icons.email,
                        height: 45,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        controller: _controller.professionController,
                        hintText: "Profession",
                        prefixIcon: Icons.work,
                        height: 45,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                     Flexible(child: 
                    CustomTextField(
                      height: 45,
                  controller: _controller.locationController,
                  hintText: "Enter Location",
                  prefixIcon: Icons.location_pin,
                ),
                    ),
                     const SizedBox(width: 10),
                     Flexible(child: 
                    CustomTextField(
                      height: 45,
                  controller: _controller.companyNameController,
                  hintText: "Company Name",
                  prefixIcon: Icons.business,
                ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: CustomTextField(
                        controller: _controller.industryController,
                        hintText: "Industry",
                        prefixIcon: Icons.business,
                        height: 45,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        controller: _controller.websiteController,
                        hintText: "Company Website",
                        prefixIcon: Icons.public,
                        height: 45,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
          Text(
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

    const SizedBox(height: 20),
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
                CustomTextField(
                  controller: _controller.passwordController,
                  hintText: "Enter Password",
                  prefixIcon: Icons.lock,
                  // obscureText: true,
                  // suffixIcon: Icons.remove_red_eye,
                  height: 45,
                  isPassword: true,
                ),
                
                const SizedBox(height: 35),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 365,
                  height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    _controller.signUp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),),
                const SizedBox(height: 30),
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    _controller.navigateToLogin(context);
                  },
                  child: const Text(
                    'Login Here',
                    style: TextStyle(color: Color(0xFF8FF2F7)),
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


class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.height = 50,
    this.isPassword = false, // New property to indicate if it's a password field
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final double height;
  final bool isPassword; // New property

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.center,
        obscureText: widget.isPassword ? obscureText : false, // Only obscure if it's a password field
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: widget.isPassword // Show visibility icon only for password field
              ? IconButton(
                  icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
              : null, // No suffix icon for non-password fields
          hintText: widget.hintText,
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



// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.prefixIcon,
//     this.obscureText = false,
//     this.suffixIcon,
//     this.height = 50,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final String hintText;
//   final IconData prefixIcon;
//   final bool obscureText;
//   final IconData? suffixIcon;
//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       child: TextField(
//         controller: controller,
//         textAlign: TextAlign.center,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           prefixIcon: Icon(prefixIcon),
//           suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
//           hintText: hintText,
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//     );
//   }
// }
