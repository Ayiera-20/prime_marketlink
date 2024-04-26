import 'package:flutter/material.dart';



class MarketTips extends StatelessWidget {
  const MarketTips({super.key});

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.teal,
        title: const Text('Market Entry Tips', style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection('Tips for Entering the Kenyan Market', [
              '1. Understand the Kenyan Culture and Values:',
              '   - Kenya is a diverse country with various ethnic groups. Understanding and respecting cultural nuances is essential for successful business relationships.',
              '2. Localize Your Business Strategy:',
              '   - Adapt your products or services to meet local preferences and needs. Consider the local language, currency, and cultural sensitivities in your marketing and communication.',
              '3. Build Strong Local Partnerships:',
              '   - Collaborate with Kenyan businesses and form strategic partnerships. Local partners can provide insights into the market and help navigate regulatory requirements.',
              '4. Embrace Mobile Technology:',
              '   - Kenya has a high mobile penetration rate. Utilize mobile platforms for marketing, transactions, and customer engagement.',
              '5. Understand Regulatory Environment:',
              '   - Familiarize yourself with Kenyan regulations and legal requirements. This includes business registration, taxation, and compliance with local laws.',
            ]),
            const SizedBox(height: 20.0),
            _buildSection('Tips for Entering Foreign Markets', [
              'Africa:',
              '   - Diversity Matters: Africa is a continent with diverse cultures and languages. Tailor your approach based on the specific region you\'re targeting.',
              'Asia:',
              '   - Building Relationships: Asian markets often value relationships and trust. Invest time in building strong connections before expecting significant business outcomes.',
              'Europe:',
              '   - Navigate Regulatory Complexity: Europe has varying regulations across countries. Ensure compliance with local laws and standards. Consider the European Union\'s regulations for broader reach.',
              'North America:',
              '   - Understand Local Consumer Behavior: Consumer behavior in North America can vary widely. Conduct market research to understand preferences and trends specific to the region you are targeting.',
              'South America:',
              '   - Adapt to Local Economies: South American countries may have diverse economic situations. Be flexible in your pricing and business model to accommodate different economic conditions.',
              'Oceania:',
              '   - Digital Integration: Oceania has a high level of digital adoption. Leverage digital platforms for marketing and sales, and be aware of the tech-savvy consumer base.',
            ]),
            const SizedBox(height: 20.0),
            _buildSection('General Tips for Global Expansion', [
              '1. Market Research:',
              '   - Conduct thorough market research before entering any foreign market. Understand consumer behavior, competition, and market trends.',
              '2. Regulatory Compliance:',
              '   - Stay informed about international regulations and compliance standards. Ensure that your business adheres to local laws and industry regulations.',
              '3. Localization:',
              '   - Adapt your marketing materials, website, and communication to the local language and cultural preferences.',
              '4. Networking:',
              '   - Build a strong network of local contacts, including business partners, industry associations, and government officials.',
              '5. Flexibility:',
              '   - Be adaptable and open to modifying your strategies based on the unique demands and challenges of each market.',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        const SizedBox(height: 8.0),
        ...content.map((item) => Text(item)),
      ],
    );
  }
}
