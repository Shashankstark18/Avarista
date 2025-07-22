import 'package:flutter/material.dart';

class FashionShoppingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image': 'lib/assets/products/product1.png',
      'title': 'Sportswear Club',
      'subtitle': 'Nike Sports T-Shirt',
      'rating': 4.8,
      'price': '\$54,80',
      'originalPrice': '\$60,00',
    },
    {
      'image': 'lib/assets/products/product2.png',
      'title': 'Originals Trefoil',
      'subtitle': 'Adidas Sports T-Shirt',
      'rating': 4.8,
      'price': '\$69,10',
      'originalPrice': '\$60,00',

    },
    {
      'image': 'lib/assets/products/product3.png',
      'title': 'Sportswear Club',
      'subtitle': 'Nike Sports T-Shirt',
      'rating': 4.8,
      'price': '\$54,80',
      'originalPrice': '\$60,00',

    },
    {
      'image': 'lib/assets/products/product4.png',
      'title': 'Originals Trefoil',
      'subtitle': 'Adidas Sports T-Shirt',
      'rating': 4.8,
      'price': '\$69,10',
      'originalPrice': '\$60,00',
    },
    {
      'image': 'lib/assets/products/product5.png',
      'title': 'Sportswear Club',
      'subtitle': 'Nike Sports T-Shirt',
      'rating': 4.8,
      'price': '\$54,80',
      'originalPrice': '\$60,00',
    },
    {
      'image': 'lib/assets/products/product6.png',
      'title': 'Originals Trefoil',
      'subtitle': 'Adidas Sports T-Shirt',
      'rating': 4.8,
      'price': '\$69,10',
      'originalPrice': '\$60,00',

    },
  ];

  final List<Map<String, dynamic>> topProducts = [
    {
      'image': 'lib/assets/products/product1.png',
      'title': 'Trendy Dress',
      'subtitle': 'Zara Fashion',
      'rating': 4.9,
      'price': '\$74,20',
      'originalPrice': '\$89,00',
    },
    {
      'image': 'lib/assets/products/product2.png',
      'title': 'Classic Blazer',
      'subtitle': 'H&M Premium',
      'rating': 4.7,
      'price': '\$92,10',
    },
  ];

  List<Map<String, dynamic>> shops = [
    {
      'image': 'lib/assets/shops/shop1.jpg',
      'name': 'name shop',
      'rating': 4.8,
    },
    {
      'image': 'lib/assets/shops/shop2.jpg',
      'name': 'name shop',
      'rating': 4.6,
    },
    {
      'image': 'lib/assets/shops/shop1.jpg',
      'name': 'name shop',
      'rating': 4.8,
    },
    {
      'image': 'lib/assets/shops/shop2.jpg',
      'name': 'name shop',
      'rating': 4.6,
    },
    {
      'image': 'lib/assets/shops/shop1.jpg',
      'name': 'name shop',
      'rating': 4.8,
    },
    {
      'image': 'lib/assets/shops/shop2.jpg',
      'name': 'name shop',
      'rating': 4.6,
    },

  ];


  void _showBottomAppBar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.home),
            Icon(Icons.search),
            Icon(Icons.shopping_bag),
            Icon(Icons.favorite),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB71C1C),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello, Welcome', style: TextStyle(color: Colors.white, fontSize: 14)),
                      Text('Albert Stevano', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.notifications_none, color: Colors.white),
                      SizedBox(width: 12),
                      Icon(Icons.shopping_cart_outlined, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Left Segment: Camera + Audio + Search
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          // Avarista Icon
                          Image.asset(
                            'lib/assets/avarista.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 6),

                          // Placeholder Text
                          const Expanded(
                            child: Text(
                              'Search',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),

                          // Mic Icon
                          const Icon(Icons.mic_none, color: Colors.grey, size: 20),
                          const SizedBox(width: 8),

                          // Camera Icon
                          const Icon(Icons.camera_alt, color: Colors.grey, size: 20),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Right Segment: Filter
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.tune, color: Colors.grey, size: 25),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Main content
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Banner
                    BannerSlider(),

                    const SizedBox(height: 24),

                    // Category grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 5,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 2,
                      children: [
                        _buildCategoryItem('lib/assets/home_icons/Vector_1.png', 'Blouse'),
                        _buildCategoryItem('lib/assets/home_icons/Vector_2.png', 'Uniform'),
                        _buildCategoryItem('lib/assets/home_icons/Vector_3.png', 'Shirt'),
                        _buildCategoryItem('lib/assets/home_icons/Vector_4.png', 'Jacket'),
                        _buildCategoryItem('lib/assets/home_icons/Vector_5.png', 'Pants'),
                        _buildCategoryItem('lib/assets/home_icons/Vector_6.png', 'Dress'),
                        _buildCategoryItem('lib/assets/home_icons/Vector_7.png', 'Hoodie'),
                        _buildCategoryItem('lib/assets/home_icons/Vector_8.png', 'T-Shirt'),
                        _buildCategoryItem('lib/assets/home_icons/Vector_9.png', 'Tank Top'),
                        _buildCategoryItem('lib/assets/home_icons/Vector_10.png', 'More', onTap: () => _showBottomAppBar(context)),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // shops section
                    // SHOP TITLE + SEE ALL
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Shops',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E1E1E),
                          ),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFA6192E),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

// SHOP CARDS
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: shops.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final shop = shops[index];
                          return Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      shop['image'],
                                      width: 185,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // ⭐ Rating
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.star, size: 14, color: Color(0xFFFFA133)), // orange star
                                          const SizedBox(width: 2),
                                          Text(
                                            shop['rating'].toString(),
                                            style: const TextStyle(
                                              color: Color(0xFF0C0C0C), // orange text
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // ❤️ Save Icon
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.bookmark_border, size: 18, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                shop['name'],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF333333),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),



                    //special discount section
                    const SizedBox(height: 24),
                    ProductSection(title: 'Special Discount', products: products, showTimer: true),
                    const SizedBox(height: 24),
                    ProductSection(title: 'Top Products', products: topProducts),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildCategoryItem(String iconPath, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5), // light grey background
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              iconPath,
              width: 28,
              height: 28,
              color: Color(0xFFA6192E), // deep red tint (if icons are black)
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}


class ProductSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> products;
  final bool showTimer;

  const ProductSection({
    Key? key,
    required this.title,
    required this.products,
    this.showTimer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title + Timer + See All
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                if (showTimer)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                    child: const Text(
                      '10:20:35',
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                const SizedBox(width: 8),
                const Text('See All', style: TextStyle(color: Colors.red)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Product Card List
        SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            padding: const EdgeInsets.only(right: 4),
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final product = products[index];
              return _DiscountCardWithBagIcon(
                image: product['image'],
                title: product['title'],
                subtitle: product['subtitle'],
                rating: product['rating'],
                price: product['price'],
                originalPrice: product['originalPrice'],
              );
            },
          ),
        ),
      ],
    );
  }
}


class _DiscountCardWithBagIcon extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double rating;
  final String price;
  final String? originalPrice;

  const _DiscountCardWithBagIcon({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
    this.originalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration( borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Color(0xFFFFA133)),
                      const SizedBox(width: 2),
                      Text(rating.toString(), style: const TextStyle(fontSize: 12, color: Color(
                          0xFF0C0C0C))),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
                  child: const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.shopping_bag_outlined, size: 16, color: Colors.black),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(price, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                    if (originalPrice != null) ...[
                      const SizedBox(width: 6),
                      Text(
                        originalPrice!,
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.95);
  int _currentIndex = 0;

  final List<Map<String, String>> bannerData = [
    {
      'title': 'Avarisra',
      'subtitle': 'Good choice for\nfashionistas',
      'image': 'lib/assets/banner/banner1.jpg',
    },
    {
      'title': 'New Trends',
      'subtitle': 'Latest arrivals\njust for you',
      'image': 'lib/assets/banner/banner1.jpg',
    },
    {
      'title': 'Try On Now',
      'subtitle': 'See how it fits\nwith AI try-on',
      'image': 'lib/assets/banner/banner1.jpg',
    },
    {
      'title': 'Try On Now',
      'subtitle': 'See how it fits\nwith AI try-on',
      'image': 'lib/assets/banner/banner1.jpg', // Replace with actual image
    },
    {
      'title': 'Top Rated',
      'subtitle': 'Favorites from\nthousands of users',
      'image': 'lib/assets/banner/banner1.jpg', // Replace with actual image
    },
    {
      'title': 'Exclusive Deals',
      'subtitle': 'Only this week\nup to 50% OFF',
      'image': 'lib/assets/banner/banner1.jpg', // Replace with actual image
    },
    {
      'title': 'Shop by Brand',
      'subtitle': 'Zara, Nike, H&M\nand many more',
      'image': 'lib/assets/banner/banner1.jpg', // Replace with actual image
    },
    {
      'title': 'Festive Specials',
      'subtitle': 'Traditional & modern\nethnic styles',
      'image': 'lib/assets/banner/banner1.jpg', // Replace with actual image
    },
  ];

  @override
  void initState() {
    super.initState();
    _autoSlide();
  }

  void _autoSlide() {
    Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;
      _currentIndex = (_currentIndex + 1) % bannerData.length;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _autoSlide(); // repeat
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        controller: _pageController,
        itemCount: bannerData.length,
        itemBuilder: (context, index) {
          final banner = bannerData[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Row(
              children: [
                // Text section with gradient background
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ Color(0xFFC5C8B2),Color(0xFFB5BEAF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          banner['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C1C5A),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          banner['subtitle']!,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Right Image
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    banner['image']!,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image_not_supported, size: 40),
                    ),
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
