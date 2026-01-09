import 'package:flutter/material.dart';
import 'package:prime_marketlink/screens/home_screen.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  static const mySnackBar = SnackBar(behavior: SnackBarBehavior.floating,
  margin: EdgeInsets.only(bottom: 700.0), 
  duration: Duration( seconds: 4),
   backgroundColor: Colors.red,
   showCloseIcon: true,
      closeIconColor: Colors.white,
   dismissDirection: DismissDirection.up,
    content:Text('Payment successfull!'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Payment',
          style: TextStyle(fontStyle: FontStyle.normal, fontSize: 20),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            // const Text('Payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            // const SizedBox(height: 20,),
            Card(
            color: Colors.teal,
            child: Container(
              margin: const EdgeInsets.all(40),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9)
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Monthly Plans', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                      Text('ksh 2,000', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)
                    ],
                  ),
                   SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MARKET RESEARCH', style: TextStyle(color: Colors.white, fontSize: 12),),
                      Text('Billed Monthly', style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Text('No discount', style: TextStyle(color: Colors.white, fontSize: 12, )),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text('15 Market Insights & analytics', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 50,),
                  
                  Text('TOTAL:Ksh 2,000', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),

          const SizedBox(height: 30,),
          
             Card(
              color: Colors.white,
              child: Container(
               width: 300,
               height: 60,
        
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              
              child: Row(
              children: [
                Image.asset("assets/images/mastercard.webp", height: 50 , width: 120,),
                const Text('Visa Payment'),

              ],
            ),
                        ),
              
          ),
          const SizedBox(height: 20,),

          
          Card(
              color: Colors.white,
              child: Container(
               width: 300,
               height: 60,
        
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.only(left: 8, right: 20),
                  child: Transform.scale(
                  scale: 2,
                       
                        child:  IconButton(onPressed: () {}, 
                 icon: const Icon (Icons.add_card_sharp)) ,
                        ),
                  
                  ),
                  const Text('Add New Card', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold),),
                
             
                ],
              ),
              
              
                 
             )),

             const SizedBox(height: 35,),
             Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              width: 150, 
               height: 50,
              child:  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                      Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(
                          userName: 'yourUserName', // Replace with the actual user name
                          userEmail: 'yourUserEmail', // Replace with the actual user email
                        ),
                      ),
                    );},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.amber,
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Set the circular radius
                        ),
                      ),
                    ),
                    child: const Text('PAY NOW', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                  ),
             ),

            
            

           
          ],
        ),
        

      ),
    );
  }
}