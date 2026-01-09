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
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            content,
            style: const TextStyle(color: Colors.black87),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Close',
                style:
                    TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      bottomNavigationBar: MyBottomNavigationBar(
        user: FirebaseAuth.instance.currentUser!,
        onTabSelected: (index) {},
        userProfile: UserProfile(
          uid: FirebaseAuth.instance.currentUser!.uid,
          displayName:
              FirebaseAuth.instance.currentUser!.displayName ?? 'Anonymous',
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // Modern App Bar
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'About Prime Market Link',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.teal.shade400, Colors.teal.shade700],
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.business_center_rounded,
                    size: 80,
                    color: Colors.white30,
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Mission Statement Card
                  _buildMissionCard(),
                  const SizedBox(height: 24),

                  // What We Do Card
                  _buildWhatWeDoCard(),
                  const SizedBox(height: 32),

                  // Services Section
                  const Text(
                    'Our Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildServiceCard(
                    'Business Expansion Consultation',
                    'Tailored advice for international expansion',
                    'assets/images/global.jpg',
                    Icons.trending_up_rounded,
                    'Our seasoned experts guide you through international expansion, providing tailored advice to ensure a triumphant venture into new markets.',
                  ),
                  const SizedBox(height: 16),

                  _buildServiceCard(
                    'International Trade Facilitation',
                    'Streamline cross-border transactions',
                    'assets/images/world-map.jpg',
                    Icons.public_rounded,
                    'Navigate international trade with ease. We provide comprehensive support to streamline cross-border transactions, minimizing complexities and maximizing efficiency.',
                  ),
                  const SizedBox(height: 16),

                  _buildServiceCard(
                    'Market Research',
                    'In-depth insights and analytics',
                    'assets/images/market.jpg',
                    Icons.analytics_rounded,
                    'Stay ahead of the curve with our in-depth market research services. Gain valuable insights into target demographics, industry trends, and competitive landscapes.',
                  ),
                  const SizedBox(height: 16),

                  _buildServiceCard(
                    'Digital E-Commerce Marketing',
                    'Elevate your online presence',
                    'assets/images/digital.jpg',
                    Icons.shopping_cart_rounded,
                    'Harness the power of digital marketing to elevate your online presence. Our specialists craft targeted strategies to amplify visibility and drive traffic.',
                  ),
                  const SizedBox(height: 16),

                  _buildServiceCard(
                    'Traditional Sales & Marketing',
                    'Time-tested methods for local markets',
                    'assets/images/smiley.jpg',
                    Icons.handshake_rounded,
                    'Blend modern strategies with time-tested methods. Our integrated approach combines traditional sales and marketing techniques, fine-tuned for local markets.',
                  ),
                  const SizedBox(height: 16),

                  _buildServiceCard(
                    'Brand Development',
                    'Build a distinctive global identity',
                    'assets/images/sky.jpg',
                    Icons.stars_rounded,
                    'Forge a distinctive global identity with our comprehensive brand development services. From strategy to design, we help you build a brand that resonates across borders.',
                  ),
                  const SizedBox(height: 32),

                  // Subscription CTA
                  _buildSubscriptionCard(context),
                  const SizedBox(height: 32),

                  // Contact Section
                  _buildContactCard(),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.teal.shade400, Colors.teal.shade600],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.flag_rounded, color: Colors.white, size: 32),
              SizedBox(width: 12),
              Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Welcome to Prime Market Link, the premier platform bridging borders and fostering global business connections. We seamlessly link foreign businesses with the vibrant Kenyan market, while empowering Kenyan enterprises to thrive internationally.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhatWeDoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.wb_incandescent_rounded,
                    color: Colors.teal, size: 24),
              ),
              const SizedBox(width: 12),
              const Text(
                'What We Do',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'At Prime Market Link we go beyond mere connection—we are your all-in-one solution for global business triumphs. As the innovative creators of this app, we also offer a suite of specialized services to supercharge your journey to success.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    String title,
    String subtitle,
    String imagePath,
    IconData icon,
    String description,
  ) {
    return InkWell(
      onTap: () => _showMoreInfoDialog(context, title, description),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Stack(
                children: [
                  Image.asset(
                    imagePath,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Icon(icon, color: Colors.white, size: 32),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Subscription()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.orange.shade400, Colors.deepOrange.shade600],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Get Real-Time Updates',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Subscribe for market research updates',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildContactIcon(
                Icons.phone,
                Colors.teal,
                () => launch('tel:+254791757883'),
              ),
              _buildContactIcon(
                FontAwesomeIcons.whatsapp,
                Colors.green,
                () => launch('https://wa.me/254791757883'),
              ),
              _buildContactIcon(
                FontAwesomeIcons.linkedin,
                Colors.blue,
                () => launch(
                    'https://www.linkedin.com/in/miriam-ayiera-295145146/'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              '+254 791 757 883',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactIcon(IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: color, size: 28),
      ),
    );
  }
}
