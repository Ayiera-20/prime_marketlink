import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:prime_marketlink/screens/login.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key); 

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

     Future.delayed(const Duration(seconds: 5), () {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Login(),         
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container( 
        child: const Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Icon(Icons.business_center_rounded, size: 80, color: Colors.amber,
            ),
            SizedBox(height: 20,),
            Text('Connecting businesses globally', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ))
          ],
        ),
      ),
    );
  }
}
