import 'package:flutter/material.dart';

class SavedItemScreen extends StatefulWidget {
  @override
  _SavedItemScreenState createState() => _SavedItemScreenState();
}

class _SavedItemScreenState extends State<SavedItemScreen> {
  List<Map<String, dynamic>> savedItems = [
    {
      'image': 'lib/assets/products/product1.png',
      'title': 'Sportswear Club',
      'subtitle': 'Nike Sports T-Shirt',
      'price': '\$54.80',
      'oldPrice': '\$60.00',
      'rating': 4.8
    },
    {
      'image': 'lib/assets/products/product2.png',
      'title': 'Originals Trefoil',
      'subtitle': 'Adidas Sports T-Shirt',
      'price': '\$69.10',
      'rating': 4.8
    },
    {
      'image': 'lib/assets/products/product3.png',
      'title': 'Sportswear Club',
      'subtitle': 'Nike Sports T-Shirt',
      'price': '\$54.80',
      'oldPrice': '\$60.00',
      'rating': 4.8
    },
    {
      'image': 'lib/assets/products/product4.png',
      'title': 'Originals Trefoil',
      'subtitle': 'Adidas Sports T-Shirt',
      'price': '\$69.10',
      'rating': 4.8
    },
    {
      'image': 'lib/assets/products/product1.png',
      'title': 'Sportswear Club',
      'subtitle': 'Nike Sports T-Shirt',
      'price': '\$54.80',
      'oldPrice': '\$60.00',
      'rating': 4.8
    },
    {
      'image': 'lib/assets/products/product2.png',
      'title': 'Originals Trefoil',
      'subtitle': 'Adidas Sports T-Shirt',
      'price': '\$69.10',
      'rating': 4.8
    },
    {
      'image': 'lib/assets/products/product3.png',
      'title': 'Sportswear Club',
      'subtitle': 'Nike Sports T-Shirt',
      'price': '\$54.80',
      'oldPrice': '\$60.00',
      'rating': 4.8
    },
    {
      'image': 'lib/assets/products/product4.png',
      'title': 'Originals Trefoil',
      'subtitle': 'Adidas Sports T-Shirt',
      'price': '\$69.10',
      'rating': 4.8
    },
    // Add or remove items to test empty state
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: savedItems.isEmpty
                ? _buildEmptyState()
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: savedItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.1,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final item = savedItems[index];
                  return _buildSavedCard(item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 2),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Saved Item',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget _buildSavedCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
      ),

      padding: const EdgeInsets.all(2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  item['image'],
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              // Top Icons
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.amber), // Yellow star
                      SizedBox(width: 2),
                      Text(
                        item['rating'].toString(),
                        style: TextStyle(fontSize: 12, color: Colors.black), // Black text
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.red, size: 22),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.shopping_bag, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(item['title'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(item['subtitle'],
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 6),
          Row(
            children: [
              Text(item['price'],
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14)),
              SizedBox(width: 6),
              if (item['oldPrice'] != null)
                Text(item['oldPrice'],
                    style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 60, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'No Saved Items!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              'You don’t have any saved items\nGo to home and add some.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
