import 'package:flutter/material.dart';
import 'package:prime_marketlink/components/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prime_marketlink/screens/connect_users.dart';
import 'package:prime_marketlink/screens/post_screen.dart';

class Industries extends StatefulWidget {
  const Industries({super.key});

  @override
  State<Industries> createState() => _IndustriesState();
}

class _IndustriesState extends State<Industries> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Industries', style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.teal,
      ),
       bottomNavigationBar: MyBottomNavigationBar(
  user: FirebaseAuth.instance.currentUser!,
  onTabSelected: (index) {
  },
  userProfile: UserProfile(
    uid: FirebaseAuth.instance.currentUser!.uid,
    displayName: FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
  ),
),
      body: Column(
        children: [
          buildSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTopRow(),
                  buildIndustryRow('Construction', [
                    'BuildMaster Inc.',
                    'Concrete Creations',
                    'Steel Structures Ltd.',
                  ]),
                  buildIndustryRow('Technology', [
                    'Tech Innovators Co.',
                    'Digital Solutions Inc.',
                    'CodeCrafters Ltd.',
                  ]),
                  buildIndustryRow('Agriculture', [
                    'Green Fields Farming',
                    'Agro Harvest Corp.',
                    'CropCare Industries',
                  ]),
                  buildIndustryRow('Tourism', [
                    'TravelWonders Ltd.',
                    'ExploreMore Adventures',
                    'Vacation Bliss Inc.',
                  ]),
                  buildIndustryRow('Finance', [
                    'BankElite One',
                    'Investment Wizards Ltd.',
                    'MoneyTrust Financials',
                  ]),
                  buildIndustryRow('Engineering', [
                    'Company XYZ',
                    'Global Ventures Inc.',
                    'Infinite Innovations',
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          // Handle search
        },
      ),
    );
  }

  Widget buildTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildTopCard('Connect with Community', Icons.people, () {
           Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ProfileListPage(),
              ));
        }),
        buildTopCard("What's Happening", Icons.info, () {
          Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PostScreen()
              ));
        }),
      ],
    );
  }

  Widget buildTopCard(String title, IconData icon, VoidCallback onPressed) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(icon),
              const SizedBox(height: 4),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndustryRow(String industry, List<String> companies) {
    return Row(
      children: [
        Expanded(
          child: buildIndustrySection(industry, companies),
        ),
      ],
    );
  }

  Widget buildIndustrySection(String industry, List<String> companies) {
    return GestureDetector(
      onTap: () {
        _showCompanyList(context, industry, companies);
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            industry,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  void _showCompanyList(BuildContext context, String industry, List<String> companies) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.black,
          child: ListView(
            children: companies.map((company) {
              return ListTile(
                title: Text(company, style: const TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                onTap: () {
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
