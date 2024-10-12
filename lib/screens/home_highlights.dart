 import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
import 'package:prime_marketlink/screens/connect_users.dart';
import 'package:prime_marketlink/screens/market_tips.dart';

class Highlights extends StatelessWidget {
  Highlights({super.key});

  final List<String> eventImages = [
    "images/yes.jpg",
    "images/webinar.jpg",
    "images/events.jpg",
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(
  user: FirebaseAuth.instance.currentUser!,
  onTabSelected: (index) {
    // Handle tab selection if needed
  },
  userProfile: UserProfile(
    uid: FirebaseAuth.instance.currentUser!.uid,
    displayName: FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
  ),
),

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Insights',
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 20),
        ),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 150,
                  color:  Colors.black,
                  child: const Center(
                    child: Text(
                      'Featured \n Businesses', style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: List.generate(
                            3,
                            (index) => Expanded(
                              child: Card(
                                color: Colors.black,
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
                                  child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text('Unilink', style: TextStyle(color: Colors.white),)),
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: List.generate(
                            3,
                            (index) => Expanded(
                              child: Card(
                                color: Colors.black,
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image:  AssetImage(eventImages[index]),
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.4),
                                        BlendMode.darken,
                                      ),
                                    ),
                                  ),
                                  child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(child: Text('Unilink', style: TextStyle(color: Colors.white),)),
                                ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Upcoming Events',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  3,
                  (index) => Card(
                    child: Column(
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.9),
                            image:  DecorationImage(
                              image: AssetImage(eventImages[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Divider(height: 10),
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text('Event 1',style: TextStyle( fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MarketTips(),
              ));
              },
            child: const Card(
              color: Color.fromARGB(178, 149, 229, 233),
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 70),
                  child: Text('Tips for Entering the Kenyan Market', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold),),
                ),
              ),
            ),),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MarketTips(),
              ));
              },
            child: const Card(
              color: Color.fromARGB(178, 149, 229, 233),
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 70),
                  child: Text('Tips for Entering Foreign Markets', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
            ),),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MarketTips(),
              ));
              },
            child: const Card(
              color: Color.fromARGB(178, 149, 229, 233),
              child: SizedBox(
                height: 70,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 70),
                  child: Text('General Tips for Global Expansion', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold)),
                ),
              ),
            ),)
          ],
        ),
      ),
    );
  }
}