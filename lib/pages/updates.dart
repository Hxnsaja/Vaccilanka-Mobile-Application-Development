import 'package:flutter/material.dart';

class UpdatesPage extends StatelessWidget {
  final List<Map<String, dynamic>> articles = [
    {
      'imgPath': 'assets/teen-vaccines.jpg',
      'title': 'Newest Vaccines that are important for teenagers',
      'shortDescription': 'Chickenpox (varicella Hepatitis A (HepA), Hepatitis B (HepB), HPV, Measles, mumps, rubella (MMR), Meningococcal disease (MenACWY) • Polio (IPV)',
    },
    {
      'imgPath': 'assets/vaccine_adults.jpeg',
      'title': 'Newest Vaccines that are important for adults',
      'shortDescription': 'Pneumococcal Vaccine, Tetanus, Diphtheria, Pertussis (Td, Tdap) Vaccine, Hepatitis A Vaccine, Hepatitis B Vaccine.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vaccine Updates',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.asset(
                  article['imgPath'],
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(article['shortDescription']),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
