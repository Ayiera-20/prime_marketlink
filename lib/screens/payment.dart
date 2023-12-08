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
  duration: Duration( seconds: 8),
   backgroundColor: Colors.red,
   showCloseIcon: true,
      closeIconColor: Colors.white,
   dismissDirection: DismissDirection.up,
    content:Text('Payment successfull!'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Text('Payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Card(
            color: Colors.teal,
            child: Container(
              margin: EdgeInsets.all(40),
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
                      Text('GYM ONLY', style: TextStyle(color: Colors.white, fontSize: 12),),
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
                      Text('15 Group Classes', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 50,),
                  
                  Text('TOTAL:Ksh 2,000', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),

          SizedBox(height: 30,),
          
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
                Image.asset("images/mastercard.webp", height: 50 , width: 120,),
                Text('Visa Payment'),

              ],
            ),
                        ),
              
          ),
          SizedBox(height: 20,),

          
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
                  Padding(padding: EdgeInsets.only(left: 8, right: 20),
                  child: Transform.scale(
                  scale: 2,
                       
                        child:  IconButton(onPressed: () {}, 
                 icon: const Icon (Icons.add_card_sharp)) ,
                        ),
                  
                  ),
                  Text('Add New Card', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold),),
                
             
                ],
              ),
              
              
                 
             )),

             SizedBox(height: 35,),
             Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: 150, 
               height: 50,
              child:  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                      // addUserDialog(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.amber,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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