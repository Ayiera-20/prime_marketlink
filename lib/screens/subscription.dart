import 'package:flutter/material.dart';
import 'package:prime_marketlink/screens/payment.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Stack(
        children: [
            Container(
            height: 200,
            
                decoration:  const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  
                  fit: BoxFit.contain, 
                ),
                
              ),

            child: AppBar(
              toolbarHeight: 80,
      centerTitle: true,
      title: const Text(
        'Receive Real Time Analytics',
        style: TextStyle( fontStyle: FontStyle.normal, fontSize: 20),
      ),
      iconTheme: const IconThemeData(color: Colors.black),

            ),
          ),

       
      Container(
        margin: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: const Color.fromARGB(255, 171, 4, 4),
            child: Container(
              margin: const EdgeInsets.all(20),
              width: 300,
              height: 150,
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
                  const SizedBox(height: 30.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MARKET RESEARCH', style: TextStyle(color: Colors.white, fontSize: 12),),
                      Text('Billed Monthly', style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Row(
                    children: [
                      Text('Kenyan Market research analytics', style: TextStyle(color: Colors.white, fontSize: 12, )),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Kenyan Market tips', style: TextStyle(color: Colors.white, fontSize: 12)),
                    Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Payment(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Subscribe',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  )
                  ],
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height:50),

          Card(
            color: const Color.fromARGB(255, 183, 138, 1),
            child: Container(
              margin: const EdgeInsets.all(20),
              width: 300,
              height: 150,
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
                   const SizedBox(height: 30.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MARKET RESEARCH', style: TextStyle(color: Colors.white, fontSize: 12),),
                      Text('Billed Monthly', style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Row(
                    children: [
                      Text('Africa market research analytics', style: TextStyle(color: Colors.white, fontSize: 12, )),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Africa market tips', style: TextStyle(color: Colors.white, fontSize: 12)),
                      Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Payment(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Subscribe',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  ],
                  )
                ],
              ),
            ),
          ),


          const SizedBox(height: 50,),
          


           Card(
            color: Colors.brown,
            child: Container(
              margin: const EdgeInsets.all(20),
              width: 300,
              height: 150,
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
                   const SizedBox(height: 30.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('MARKET RESEARCH', style: TextStyle(color: Colors.white, fontSize: 12),),
                      Text('Billed Monthly', style: TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Row(
                    children: [
                      Text('Europe market research analytics', style: TextStyle(color: Colors.white, fontSize: 12, )),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Europe market tips', style: TextStyle(color: Colors.white, fontSize: 12)),
                      Container(
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Payment(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        'Subscribe',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  ],
                  )
                ],
              ),
            ),
          )
          

        ],
      ),
      ),

      ],
      ), 
    );
  }
}



