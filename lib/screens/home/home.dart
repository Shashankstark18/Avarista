import 'package:flutter/material.dart';
import 'dart:async';
import 'package:avarista/screens/home/search/search.dart';
import 'filter/filter.dart';
import 'saved_item/saved.dart';

class FashionShoppingScreen extends StatefulWidget {
  @override
  _FashionShoppingScreenState createState() => _FashionShoppingScreenState();
}

class _FashionShoppingScreenState extends State<FashionShoppingScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isBottomBarVisible = true;
  double _lastScrollPosition = 0;

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

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    const double scrollThreshold = 10.0; // Minimum scroll distance to trigger hide/show

    double currentScrollPosition = _scrollController.offset;
    double scrollDifference = currentScrollPosition - _lastScrollPosition;

    if (scrollDifference.abs() > scrollThreshold) {
      bool shouldShowBottomBar = scrollDifference < 0; // Scrolling up

      if (shouldShowBottomBar != _isBottomBarVisible) {
        setState(() {
          _isBottomBarVisible = shouldShowBottomBar;
        });
      }
      _lastScrollPosition = currentScrollPosition;
    }
  }

  Widget _buildAppBarIcon(IconData icon, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withOpacity(0.2) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double scrollableRedHeaderHeight = MediaQuery.of(context).padding.top + 160;
 // Space below banner before the white section starts

      return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                clipBehavior: Clip.none, // Allows overflow
                children: [
                  // 🔴 RED HEADER
                  Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 26,
                      left: 16,
                      right: 16,
                      bottom: 100, // enough space for the banner to overflow without being clipped
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFA6192E), Color(0xFFA6192E)],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Welcome + Notification
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Hello, Welcome',
                                    style: TextStyle(color: Colors.white, fontSize: 14)),
                                Text('Albert Stevano',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.notifications_none, color: Colors.white),
                                SizedBox(width: 12),
                                Icon(Icons.shopping_cart_outlined, color: Colors.white),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // 🔍 Search + Filter
                        Align(
                          alignment: Alignment.center,
                          child: FractionallySizedBox(
                            widthFactor: 0.999, // 90% of screen width
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) => SearchScreen()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset('lib/assets/avarista.png', width: 30, height: 25),
                                          const SizedBox(width: 6),
                                          const Expanded(
                                            child: Text('Search', style: TextStyle(color: Colors.grey)),
                                          ),
                                          const Icon(Icons.mic_none, color: Colors.grey, size: 25),
                                          const SizedBox(width: 12),
                                          const Icon(Icons.camera_alt, color: Colors.grey, size: 25),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => FilterScreen()));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Icon(Icons.tune, color: Colors.grey, size: 30),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🖼️ Positioned BANNER
                  Positioned(
                    left: 16,
                    right: 16,
                    bottom: -80, // Half outside the red container
                    child: const BannerSlider(), // your existing banner widget
                  ),
                ],
              ),
            ),

            // Scrollable content
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 5,
                        mainAxisSpacing: 6,
                        crossAxisSpacing: 6,
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
                          _buildCategoryItem('lib/assets/home_icons/Vector_10.png', 'More'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Shops', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E1E1E))),
                          Text('See All', style: TextStyle(fontSize: 14, color: Color(0xFFA6192E), fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 16),
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
                                      child: Image.asset(shop['image'], width: 195, height: 140, fit: BoxFit.cover),
                                    ),
                                    Positioned(
                                      top: 8,
                                      left: 8,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.star, size: 14, color: Color(0xFFFFA133)),
                                            const SizedBox(width: 2),
                                            Text(shop['rating'].toString(), style: const TextStyle(color: Color(0xFF0C0C0C), fontSize: 12, fontWeight: FontWeight.w600)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.8), shape: BoxShape.circle),
                                        child: const Icon(Icons.bookmark_border, size: 18, color: Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(shop['name'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF333333))),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      ProductSection(title: 'Special Discount', products: products, showTimer: true),
                      const SizedBox(height: 24),
                      ProductSection(title: 'Top Products', products: topProducts),
                      SizedBox(height: 80 + MediaQuery.of(context).padding.bottom),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      bottomNavigationBar: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: _isBottomBarVisible ? Offset.zero : const Offset(0, 1),
        child: Container(
          height: 80,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildAppBarIcon(Icons.home, false, () {
                    // Navigate to Home screen
                  }),
                  const SizedBox(width: 8),
                  _buildAppBarIcon(Icons.apps, false, () {
                    // Navigate to apps screen
                  }),
                  const SizedBox(width: 8),
                  _buildAppBarIcon(Icons.map_outlined, false, () {
                    // Navigate to map screen
                  }),
                  const SizedBox(width: 8),
                  _buildAppBarIcon(Icons.favorite_outline, true, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SavedItemScreen()),
                    );
                  }),
                  const SizedBox(width: 8),
                  _buildAppBarIcon(Icons.person_outline, false, () {
                    // Navigate to profile screen
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _buildCategoryItem and other helper widgets remain the same
  Widget _buildCategoryItem(String iconPath, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              iconPath,
              width: 29,
              height: 29,
              color: Color(0xFFA6192E),
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

// ProductSection and _DiscountCardWithBagIcon classes remain unchanged
class ProductSection extends StatefulWidget {
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
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  late Timer _timer;
  Duration _duration = const Duration(hours: 10, minutes: 20, seconds: 35);

  @override
  void initState() {
    super.initState();
    if (widget.showTimer) _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_duration.inSeconds == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _duration -= const Duration(seconds: 1);
        });
      }
    });
  }

  String _formatDuration(Duration d) {
    final h = d.inHours.toString().padLeft(2, '0');
    final m = (d.inMinutes % 60).toString().padLeft(2, '0');
    final s = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$h:$m:$s";
  }

  @override
  void dispose() {
    if (widget.showTimer) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                if (widget.showTimer)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFFA6192E), borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      _formatDuration(_duration),
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                const SizedBox(width: 8),
                const Text('See All', style: TextStyle(color: Color(0xFFA6192E), fontSize: 14)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.products.length,
            padding: const EdgeInsets.only(right: 4),
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final product = widget.products[index];
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
      width: 200,
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Color(0xFFFFA133)),
                      const SizedBox(width: 2),
                      Text(rating.toString(), style: const TextStyle(fontSize: 12, color: Color(0xFF0C0C0C))),
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
  final PageController _pageController = PageController(viewportFraction: 1.1);
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
      'image': 'lib/assets/banner/banner1.jpg',
    },
    {
      'title': 'Top Rated',
      'subtitle': 'Favorites from\nthousands of users',
      'image': 'lib/assets/banner/banner1.jpg',
    },
    {
      'title': 'Exclusive Deals',
      'subtitle': 'Only this week\nup to 50% OFF',
      'image': 'lib/assets/banner/banner1.jpg',
    },
    {
      'title': 'Shop by Brand',
      'subtitle': 'Zara, Nike, H&M\nand many more',
      'image': 'lib/assets/banner/banner1.jpg',
    },
    {
      'title': 'Festive Specials',
      'subtitle': 'Traditional & modern\nethnic styles',
      'image': 'lib/assets/banner/banner1.jpg',
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
      _autoSlide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: PageView.builder(
        controller: _pageController,
        itemCount: bannerData.length,
        itemBuilder: (context, index) {
          final banner = bannerData[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
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
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFC5C8B2), Color(0xFFB5BEAF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          banner['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C1C5A),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          banner['subtitle'] ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  )
                  ,
                ),
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