import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          children: [
            Text('Payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            Card(
            color: Colors.blue,
            child: Container(
              margin: EdgeInsets.all(40),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9)
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Monthly Plans', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                      Text('ksh 2,000', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),)
                    ],
                  ),
                   SizedBox(height: 30.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('GYM ONLY', style: TextStyle(color: Colors.white, fontSize: 12),),
                      Text('Billed Monthly', style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                  SizedBox(height: 20.0),
                  const Row(
                    children: [
                      Text('No discount', style: TextStyle(color: Colors.white, fontSize: 12, )),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('15 Group Classes', style: TextStyle(color: Colors.white, fontSize: 12)),
                      Container(
                        height: 20,
                        width: 80,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), shape: BoxShape.rectangle,border: Border.all(color: Colors.white)),
                        child:  TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Payment(),
                            ),
                          );
                         
                        },
                        child: const Text('Subscribe', style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                      )

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
              child: Container(
               width: 300,
               height: 50,
        
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              
                  child: const Text('visa payment'),
                        ),
              
          ),
          SizedBox(height: 20,),
          Card(
              child: Container(
               width: 300,
               height: 50,
        
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              
                  child: const Text('Add new card'),
                        ),),

          SizedBox(height: 30,),
          Card(
              child: Container(
               width: 200,
               height: 40,
        
               decoration: BoxDecoration(
                shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(9.9),
              ),
              
                  child: const Text('PAY NOW'),
             )),
          ],
        ),

      ),
    );
  }
}