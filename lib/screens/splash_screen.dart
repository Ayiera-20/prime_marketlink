// import "package:flutter/material.dart";
// import "package:flutter/services.dart";
// import "package:prime_marketlink/screens/login.dart";

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key); 

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

//      Future.delayed(const Duration(seconds: 5), () {
//       return Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => Login(),         
//       ));
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container( 
//         child: const Column(
//           mainAxisAlignment:MainAxisAlignment.center,
//           children: [
//             Icon(Icons.business_center_rounded, size: 80, color: Colors.amber,
//             ),
//             SizedBox(height: 20,),
//             Text('Connecting businesses globally', style: TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontSize: 30,
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prime_marketlink/screens/login.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    _controller = AnimationController(
      // Adjust the duration for the split transition
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Add a listener to execute code while animation is running
    _animation.addListener(() {
      setState(() {});
    });

    // Start the animation
    _controller.forward();

    // Delayed navigation to the next screen
    Future.delayed(const Duration(seconds: 3), () {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Login(),
      ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Calculate background color based on the animation value
          Color backgroundColor = Color.lerp(
            // Adjust the starting color
            Colors.black,
            // Adjust the ending color
            Colors.teal,
            _animation.value,
          ) ?? Colors.black;

          // Calculate opacity for the curtain/page opening effect
          double opacity = 1.0 - _animation.value;

          return Stack(
            fit: StackFit.expand,
            children: [
              // Curtain/page opening effect
              Positioned(
                // Adjust the starting position of the split
                top: -MediaQuery.of(context).size.height * _animation.value,
                left: -MediaQuery.of(context).size.width * _animation.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: backgroundColor,
                ),
              ),
              Positioned(
                // Adjust the starting position of the split for the other side
                bottom: -MediaQuery.of(context).size.height * _animation.value,
                right: -MediaQuery.of(context).size.width * _animation.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: backgroundColor,
                ),
              ),
              // Content of the splash screen
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.business_center_rounded,
                      size: 80,
                      color: Colors.teal,
                    ),
                  //   SvgPicture.asset(
                  //   'assets/images/connected.svg',
                  //   semanticsLabel: 'My SVG Image',
                  //   height: 100,
                  //   width: 100,
                  // ),

                    SizedBox(height: 14),
                    Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                      'Connecting businesses globally',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // Adjust the text color as needed
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                    
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
