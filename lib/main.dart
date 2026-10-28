import 'package:flutter/material.dart';

void main() => runApp(const MenuApp());

/// Data for one menu item.
class MenuItem {
  final String name;
  final String description;
  final String price;
  final String image;
  final IconData icon;

  const MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.icon,
  });
}

// Change these to match your own flowers.
const List<MenuItem> menuItems = [
  MenuItem(
    name: 'Blue Roses',
    description: 'A bouquet fresh of long-stem roses',
    price: 'RM 89.00',
    image: 'assets/images/rose.jpg',
    icon: Icons.favorite,
  ),
  MenuItem(
    name: 'Sunflowers',
    description: 'Bright and cheerful sunflowers bouquet',
    price: 'RM 55.00',
    image: 'assets/images/sunflower.jpg',
    icon: Icons.wb_sunny,
  ),
  MenuItem(
    name: 'Tulips',
    description: 'Soft pastel tulips bouquet, bunch of 10',
    price: 'RM 65.00',
    image: 'assets/images/tulip.jpg',
    icon: Icons.local_florist,
  ),
  MenuItem(
    name: 'Lavender',
    description: 'Fragrant dried lavender bouquet, perfect for relaxation',
    price: 'RM 40.00',
    image: 'assets/images/lavender.jpg',
    icon: Icons.spa,
  ),
  MenuItem(
    name: 'Orchid Pot',
    description:
        'Elegant phalaenopsis orchid in a bouquet, perfect for gifting',
    price: 'RM 120.00',
    image: 'assets/images/orchid.jpg',
    icon: Icons.eco,
  ),
];

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petal & Bloom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF5BB5E8),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),
      appBar: AppBar(
        title: const Text('Petal & Bloom'),
        backgroundColor: const Color(0xFF2A7BB8),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header banner built with a Container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF5BB5E8),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Blooms",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Fresh flowers for every occasion',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Scrollable list of menu cards
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return MenuCard(item: menuItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                // Shows a placeholder if the image file is missing.
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 90,
                    height: 90,
                    color: const Color(0xFFBBDEFB),
                    child: Icon(
                      item.icon,
                      size: 40,
                      color: const Color(0xFF2A7BB8),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(item.description),
                  const SizedBox(height: 6),
                  Text(
                    item.price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2A7BB8),
                    ),
                  ),
                ],
              ),
            ),
            Icon(item.icon, color: const Color(0xFF5BB5E8)),
          ],
        ),
      ),
    );
  }
}
