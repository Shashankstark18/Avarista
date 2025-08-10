import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCategorySection(title: 'Shops', items: _getShopItems()),
            const SizedBox(height: 24),
            _buildCategorySection(title: 'Dress', items: _getDressItems()),
            const SizedBox(height: 24),
            _buildCategorySection(title: 'Sport', items: _getSportItems()),
            const SizedBox(height: 24),
            _buildCategorySection(title: 'Hoodie', items: _getHoodieItems()),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection({
    required String title,
    required List<CategoryItem> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle see all action
              },
              child: const Text(
                'See All',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1.0, // square items
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _buildCategoryItem(items[index]);
          },
        ),
      ],
    );
  }

  Widget _buildCategoryItem(CategoryItem item) {
    return GestureDetector(
      onTap: () {
        // Handle item tap
        print('Tapped on category item');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            item.imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported,
                  size: 24, color: Colors.grey);
            },
          ),
        ),
      ),
    );
  }

  // Sample Items
  List<CategoryItem> _getShopItems() {
    return List.generate(
      10,
          (index) => CategoryItem(
        imagePath: 'lib/assets/shops/shop${(index % 2) + 1}.jpg',
      ),
    );
  }

  List<CategoryItem> _getDressItems() {
    return List.generate(
      10,
          (index) => CategoryItem(
        imagePath: 'lib/assets/products/product${(index % 6) + 1}.png',
      ),
    );
  }

  List<CategoryItem> _getSportItems() {
    return List.generate(
      10,
          (index) => CategoryItem(
        imagePath: 'lib/assets/products/product${(index % 6) + 1}.png',
      ),
    );
  }

  List<CategoryItem> _getHoodieItems() {
    return List.generate(
      10,
          (index) => CategoryItem(
        imagePath: 'lib/assets/products/product${(index % 6) + 1}.png',
      ),
    );
  }
}

class CategoryItem {
  final String imagePath;

  CategoryItem({required this.imagePath});
}