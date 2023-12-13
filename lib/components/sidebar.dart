import 'package:flutter/material.dart';
import 'package:prime_marketlink/screens/about_us.dart';
import 'package:prime_marketlink/screens/connect_users.dart';
import 'package:prime_marketlink/screens/home_highlights.dart';
import 'package:prime_marketlink/screens/login.dart';
import 'package:prime_marketlink/screens/post_screen.dart';
import 'package:prime_marketlink/screens/profile.dart';
import 'package:prime_marketlink/screens/review_form.dart';
import 'package:prime_marketlink/screens/subscription.dart';
import 'package:prime_marketlink/services/messaging_service.dart';




  

class CustomSidebar extends StatefulWidget {

  final UserProfile userProfile;
  final String userName;
  final String userEmail;
  // final File? userImage;

  const CustomSidebar({
    required this.userName,
    required this.userEmail,
    required this.userProfile,
    // this.userImage,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(widget.userName),
            accountEmail: Text(widget.userEmail),
            currentAccountPicture: CircleAvatar(
              // backgroundImage: userImage != null
              //     ? FileImage(userImage!) // Use Image.file for FileImage
              //     : AssetImage('images/avatar.png') as ImageProvider, // Cast to ImageProvider
            ),
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Prime Market Link'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Aboutus(),
                    ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Profile(userProfile: widget.userProfile),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.trending_up), 
            title: const Text('Market Insights'),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  Highlights(),
                    ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.whatshot), 
            title: const Text('What\'s Happening'),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PostScreen(),
                    ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person), 
            title: const Text('Connect with the community'),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileListPage(),
                    ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.message), 
            title: const Text('Messages'),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatScreen(),
                    ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.send),
            title: const Text('Subscribe to our mailing list'),
             onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Subscription(),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text('Send Feedback'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  CustomerReviewsPage(),
                    ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            onTap: () {
              // Handle Privacy Policy tap
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
            },
          ),
          const SizedBox(height: 20,),
          ListTile(
            title: const Text('close window'),
            leading: const Icon(Icons.close_outlined),
            onTap: () {
              
              Navigator.pop(context);
            },
          ),
        ],
      ),
      
    );
  }
}
