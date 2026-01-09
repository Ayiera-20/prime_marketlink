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
  String searchQuery = '';

  final Map<String, Map<String, dynamic>> industriesData = {
    'Construction': {
      'icon': Icons.construction,
      'color': Colors.orange,
      'companies': [
        'BuildMaster Inc.',
        'Concrete Creations',
        'Steel Structures Ltd.'
      ]
    },
    'Technology': {
      'icon': Icons.computer,
      'color': Colors.blue,
      'companies': [
        'Tech Innovators Co.',
        'Digital Solutions Inc.',
        'CodeCrafters Ltd.'
      ]
    },
    'Agriculture': {
      'icon': Icons.eco,
      'color': Colors.green,
      'companies': [
        'Green Fields Farming',
        'Agro Harvest Corp.',
        'CropCare Industries'
      ]
    },
    'Tourism': {
      'icon': Icons.flight,
      'color': Colors.purple,
      'companies': [
        'TravelWonders Ltd.',
        'ExploreMore Adventures',
        'Vacation Bliss Inc.'
      ]
    },
    'Finance': {
      'icon': Icons.account_balance,
      'color': Colors.teal,
      'companies': [
        'BankElite One',
        'Investment Wizards Ltd.',
        'MoneyTrust Financials'
      ]
    },
    'Engineering': {
      'icon': Icons.engineering,
      'color': Colors.red,
      'companies': [
        'Company XYZ',
        'Global Ventures Inc.',
        'Infinite Innovations'
      ]
    },
  };

  @override
  Widget build(BuildContext context) {
    final filteredIndustries = industriesData.entries.where((entry) {
      return entry.key.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Industries',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        user: FirebaseAuth.instance.currentUser!,
        onTabSelected: (index) {},
        userProfile: UserProfile(
          uid: FirebaseAuth.instance.currentUser!.uid,
          displayName:
              FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildQuickActions(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: filteredIndustries.length,
              itemBuilder: (context, index) {
                final entry = filteredIndustries[index];
                return _buildIndustryCard(
                  entry.key,
                  entry.value['icon'],
                  entry.value['color'],
                  entry.value['companies'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          setState(() {
            searchQuery = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search industries...',
          prefixIcon: const Icon(Icons.search, color: Colors.teal),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: _buildActionCard(
              'Connect',
              Icons.people_outline,
              Colors.teal,
              () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileListPage(),
                ));
              },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildActionCard(
              'Updates',
              Icons.article_outlined,
              Colors.blue,
              () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PostScreen(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndustryCard(
      String industry, IconData icon, Color color, List<String> companies) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () =>
            _showCompanyList(context, industry, companies, icon, color),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 40, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                industry,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                '${companies.length} companies',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCompanyList(BuildContext context, String industry,
      List<String> companies, IconData icon, Color color) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, color: color, size: 28),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          industry,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: companies.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 8),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: color.withOpacity(0.2),
                              child:
                                  Icon(Icons.business, color: color, size: 20),
                            ),
                            title: Text(
                              companies[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios, size: 16),
                            onTap: () {
                              // Navigate to company details
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
