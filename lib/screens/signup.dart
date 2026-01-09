import 'package:flutter/material.dart';
import 'package:prime_marketlink/controllers/signUpController.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final bool _obscureText = true;
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
      body: SingleChildScrollView(
        child: Column(children: [
             Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                children: [
               
          
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Join Prime Market Link',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
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
                const SizedBox(height: 20,),
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
          const Text(
            'Company Size',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
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
                          selectedCompanySize = value;
                        });
                      },
                    ),
                    const Text("<50"),
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
                          selectedCompanySize = value;
                        });
                      },
                    ),
                    const Text("50-100"),
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
                          selectedCompanySize = value;
                        });
                      },
                    ),
                    const Text("100-500"),
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
                          selectedCompanySize = value;
                        });
                      },
                    ),
                    const Text("500-1000+"),
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
          const Text(
            'Business Type',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
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
                          selectedBusinessType = value;
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
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _controller.passwordController,
                  hintText: "Enter Password",
                  prefixIcon: Icons.lock,
                  // obscureText: true,
                  // suffixIcon: Icons.remove_red_eye,
                  height: 45,
                  isPassword: true,
                ),
                
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      _controller.signUp(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _controller.navigateToLogin(context);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFF8FF2F7),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ],),
      ),
         
                ],
              ),
            ),
      
    );
  }
}


class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.height = 50,
    this.isPassword = false, // New property to indicate if it's a password field
  });

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
    return SizedBox(
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? obscureText : false,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.prefixIcon, color: Colors.teal, size: 20),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
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
