import 'package:flutter/material.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prime_marketlink/screens/connect_users.dart';
import 'package:prime_marketlink/screens/subscription.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({super.key});

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {

  void _showMoreInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black, // Set background color
          title: Text(
            title,
            style: const TextStyle(color: Colors.white), // Set title text color
          ),
          content: Text(
            content,
            style: const TextStyle(color: Colors.white), // Set content text color
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close',
              style: TextStyle(color: Color.fromARGB(255, 3, 244, 244)),),
            ),
          ],
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
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


      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child: Stack(
        children: [

          SizedBox(
            height: 160,
            child: AppBar(
              toolbarHeight: 100,
        // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.0), bottomLeft: Radius.circular(20))),
      backgroundColor: Colors.teal,
      iconTheme: const IconThemeData(color: Colors.black),
            ),
          ),
          
          Column(
            children: [
               Padding(padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.white,
                   margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  elevation: 0,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black,
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'About Prime Market Link', 
                    style: TextStyle( fontWeight: FontWeight.bold, fontSize: 16, color:Colors.white),
                  ),
                      ),
                      const Divider(height: 7),
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 0.3),
                    )
                  ),
                  child: const Text('Welcome to Prime Market Link, the premier platform bridging borders and fostering global business connections. \n \n This innovative app is dedicated to seamlessly linking foreign businesses with the vibrant and dynamic Kenyan market, while also empowering Kenyan enterprises to explore and thrive in international markets.',
                  style: TextStyle(fontSize: 12),),
                      )
                    ],
                  ),


                ),
                
                
                ),
                Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.white,
                        elevation: 5,
                        child: Container(
                          width: 500,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(9.9),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20, top: 4, right: 20),
                            child: Text('At Prime Market Link we go beyond mere connection—we are your all-in-one solution for global business triumphs. \n \n As the innovative creators of this app, we also offer a suite of specialized services to supercharge your journey to success.', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10,),

                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        color: Colors.black,
                        child: Container(
                          width: 120,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(9.9),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 17, top: 10, right: 20,),
                            child: Text('Our Services', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                          ),
                        ),
                      ),
                 Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(child: 
               Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 15, right: 10),
               child: InkWell(
                 onTap: () {
                          // Show more info dialog when the card is clicked
                          _showMoreInfoDialog(
                            context,
                            'Business Expansion Consultation',
                            'Our seasoned experts are here to guide you through the intricacies of international expansion, providing tailored advice to ensure a triumphant venture into new markets.',
                          );
                        },
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: const DecorationImage(
                          image: AssetImage("images/global.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      const Divider(height: 1),
                      Container(
                        
                        padding: const EdgeInsets.all(16.0),
                  child: const Text('Business Expansion Consultation'),
                      )
                    ],
                  ),


                ),)
                
                
                ),),
                Flexible(child: 
                 Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 15),
                 child: InkWell(
                 onTap: () {
                          // Show more info dialog when the card is clicked
                          _showMoreInfoDialog(
                            context,
                            'International Trade Facilitation',
                            'Navigate international trade with ease. We provide comprehensive support to streamline cross-border transactions, minimizing complexities and maximizing efficiency.',
                          );
                        },
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: const DecorationImage(
                          image: AssetImage("images/world-map.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      const Divider(height: 1),
                      Container(
                        
                        padding: const EdgeInsets.all(16.0),
                  child: const Text('International Trade Facilitation'),
                      )
                    ],
                  ),


                ),)
                
                
                ),
              
                ),
            ],
          ),
             
                const SizedBox(height: 10,),


                Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(child: 
               Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 15, right: 10),
               child: InkWell(
                 onTap: () {
                          // Show more info dialog when the card is clicked
                          _showMoreInfoDialog(
                            context,
                            'Market Research',
                            'Stay ahead of the curve with our in-depth market research services. Gain valuable insights into target demographics, industry trends, and competitive landscapes, empowering your decision-making and market positioning.',
                          );
                        },
                child: Card(
                  elevation: 5.0,
                  
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: const DecorationImage(
                          image: AssetImage("images/market.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      const Divider(height: 1),
                      Container(
                        
                        padding: const EdgeInsets.all(16.0),
                  child: const Text('Market Research'),
                      )
                    ],
                  ),


                ),)
                
                
                ),
              ),
              Flexible(child: 
                 Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 15),
                 child: InkWell(
                 onTap: () {
                          // Show more info dialog when the card is clicked
                          _showMoreInfoDialog(
                            context,
                            'Digital E-Commerce Marketing',
                            'Harness the power of digital marketing to elevate your online presence. Our specialists craft targeted strategies to amplify visibility, drive traffic, and enhance your e-commerce prowess.',
                          );
                        },
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: const DecorationImage(
                          image: AssetImage("images/digital.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      const Divider(height: 1),
                      Container(
                        
                        padding: const EdgeInsets.all(16.0),
                  child: const Text('Digital E-Commerce Marketing'),
                      )
                    ],
                  ),


                ),)
                
                
                ),
              ),
              
            ],
          ),
             


                     Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(child: 
               Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 15, right: 10),
               child: InkWell(
                 onTap: () {
                          // Show more info dialog when the card is clicked
                          _showMoreInfoDialog(
                            context,
                            'Traditional Sales and Marketing',
                            ' Blend modern strategies with time-tested methods. Our integrated approach combines traditional sales and marketing techniques, fine-tuned for local markets.',
                          );
                        },
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: const DecorationImage(
                          image: AssetImage("images/smiley.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      const Divider(height: 1),
                      Container(
                        
                        padding: const EdgeInsets.all(16.0),
                  child: const Text('Traditional Sales and Marketing'),
                      )
                    ],
                  ),


                ),)
                
                
                ),),
                Flexible(child: 
                 Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 10, right: 15),
                 child: InkWell(
                 onTap: () {
                          // Show more info dialog when the card is clicked
                          _showMoreInfoDialog(
                            context,
                            'Brand Development',
                            'Forge a distinctive global identity with our comprehensive brand development services. From strategy to design, we help you build a brand that resonates across borders.',
                          );
                        },
                child: Card(
                  elevation: 5.0,
                  child: Column(
                    children: [
                      Container(
                      height: 150, 
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.9),
                        image: const DecorationImage(
                          image: AssetImage("images/sky.jpg"), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                      const Divider(height: 1),
                      Container(
                        
                        padding: const EdgeInsets.all(16.0),
                  child: const Text('Brand Development'),
                      )
                    ],
                  ),


                ),)
                
                
                ),),
              
            ],
          ),
          TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Subscription(),
                    ));
                  },
                  child: const Text(
                    'Subscribe for real-time market research updates.',
                    style: TextStyle(color: Color.fromARGB(255, 134, 10, 51), decoration: TextDecoration.underline),
                  ),
                ), 

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    color: Colors.black,
    child: Container(
      width: double.infinity, // Use double.infinity to make the container take up the available width
      height: 45,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(9.9),
      ),
      child:  Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
  child: Row(
    children: [
      GestureDetector(
                onTap: () {
                  launch('tel:+254 791757883'); // Replace with your phone number
                },
                child: Icon(
                  Icons.phone,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  launch('https://wa.me/0791757883'); // Replace with your WhatsApp link
                },
                child: Icon(
                  FontAwesomeIcons.whatsapp, // You can use Icons.message for a messaging icon
                  size: 16,
                  color: Colors.amber,
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  launch('https://www.linkedin.com/in/miriam-ayiera-295145146/'); // Replace with your LinkedIn profile link
                },
                child: Icon(
                 FontAwesomeIcons.linkedin,
                  size: 16,
                  color: Color.fromARGB(148, 33, 229, 243),
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  launch('+254 791757883',
                  ); // Replace with your phone number
                },
                child: Text(
                  'Contact Us: 0791757883',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white, decoration: TextDecoration.underline),
                ),
              ),
    ],
  ),
),

          ],
        ),
      ))
                    ),
    ),
            ],

          )
        ],
      ),
      )
    );
  }
}