import 'package:flutter/material.dart';

class MarketTips extends StatelessWidget {
  const MarketTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.teal,
        title: const Text(
          'Market Insights',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            const SizedBox(height: 16),
            _buildKenyanMarketSection(),
            const SizedBox(height: 16),
            _buildRegionalMarketsSection(),
            const SizedBox(height: 16),
            _buildGlobalExpansionSection(),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.teal, Colors.teal.shade700],
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.trending_up,
              size: 60, color: Colors.white.withOpacity(0.9)),
          const SizedBox(height: 16),
          const Text(
            'Expand Your Business',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Strategic insights for market entry and growth',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildKenyanMarketSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            'Kenyan Market Entry',
            Icons.location_on,
            Colors.orange,
          ),
          const SizedBox(height: 12),
          _buildTipCard(
            'Understand Culture',
            'Kenya is diverse with various ethnic groups. Respect cultural nuances for successful business relationships.',
            Icons.people,
            Colors.orange,
          ),
          _buildTipCard(
            'Localize Strategy',
            'Adapt products and services to meet local preferences. Consider language, currency, and cultural sensitivities.',
            Icons.language,
            Colors.orange,
          ),
          _buildTipCard(
            'Build Partnerships',
            'Collaborate with local businesses. Partners provide market insights and help navigate regulations.',
            Icons.handshake,
            Colors.orange,
          ),
          _buildTipCard(
            'Embrace Mobile Tech',
            'Kenya has high mobile penetration. Utilize mobile platforms for marketing and transactions.',
            Icons.phone_android,
            Colors.orange,
          ),
          _buildTipCard(
            'Know Regulations',
            'Familiarize yourself with business registration, taxation, and local compliance requirements.',
            Icons.gavel,
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildRegionalMarketsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            'Regional Markets',
            Icons.public,
            Colors.blue,
          ),
          const SizedBox(height: 12),
          _buildRegionCard(
            'Africa',
            'Diverse cultures and languages. Tailor your approach based on specific regions.',
            Icons.travel_explore,
            Colors.green,
          ),
          _buildRegionCard(
            'Asia',
            'Focus on building relationships and trust before expecting business outcomes.',
            Icons.architecture,
            Colors.red,
          ),
          _buildRegionCard(
            'Europe',
            'Navigate varying regulations. Ensure compliance with local laws and EU standards.',
            Icons.euro,
            Colors.blue,
          ),
          _buildRegionCard(
            'North America',
            'Understand diverse consumer behavior. Conduct thorough market research.',
            Icons.location_city,
            Colors.purple,
          ),
          _buildRegionCard(
            'South America',
            'Be flexible with pricing and business models to accommodate different economies.',
            Icons.landscape,
            Colors.orange,
          ),
          _buildRegionCard(
            'Oceania',
            'High digital adoption. Leverage digital platforms for tech-savvy consumers.',
            Icons.devices,
            Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _buildGlobalExpansionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            'Global Expansion Essentials',
            Icons.explore,
            Colors.purple,
          ),
          const SizedBox(height: 12),
          _buildTipCard(
            'Market Research',
            'Conduct thorough research on consumer behavior, competition, and market trends.',
            Icons.analytics,
            Colors.purple,
          ),
          _buildTipCard(
            'Regulatory Compliance',
            'Stay informed about international regulations and ensure adherence to local laws.',
            Icons.policy,
            Colors.purple,
          ),
          _buildTipCard(
            'Localization',
            'Adapt marketing materials and communication to local language and culture.',
            Icons.translate,
            Colors.purple,
          ),
          _buildTipCard(
            'Networking',
            'Build connections with local partners, associations, and government officials.',
            Icons.group_add,
            Colors.purple,
          ),
          _buildTipCard(
            'Stay Flexible',
            'Be adaptable and ready to modify strategies based on market demands.',
            Icons.autorenew,
            Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }

  Widget _buildTipCard(
      String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
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

  Widget _buildRegionCard(
      String region, String tip, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    region,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tip,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
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
}
