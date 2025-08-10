import 'package:flutter/material.dart';

class MyCartScreen extends StatefulWidget {
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  List<CartItem> cartItems = [];
  TextEditingController discountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  void loadCartItems() {
    cartItems = [
      CartItem(
        name: "Cotton long sleeve k",
        category: "Women's wear",
        price: 69.10,
        originalPrice: 69.00,
        image: "lib/assets/products/product1.png",
        quantity: 1,
        color: const Color(0xFFE3F2FD),
      ),
      CartItem(
        name: "Cotton long sleeve jacket",
        category: "Women's wear",
        price: 69.10,
        originalPrice: 69.00,
        image: "lib/assets/products/product1.png",
        quantity: 1,
        color: const Color(0xFFE3F2FD),
      ),
      CartItem(
        name: "Cotton long sleeve jacket",
        category: "Women's wear",
        price: 26.00,
        originalPrice: null,
        image: "lib/assets/products/product1.png",
        quantity: 2,
        color: const Color(0xFFE57373),
      ),
      CartItem(
        name: "Cotton long jacket",
        category: "Women's wear",
        price: 69.10,
        originalPrice: 69.00,
        image: "lib/assets/products/product1.png",
        quantity: 1,
        color: const Color(0xFFE3F2FD),
      ),
      // Additional products
      CartItem(
        name: "Denim jacket",
        category: "Men's wear",
        price: 89.99,
        originalPrice: 99.99,
        image: "lib/assets/products/product1.png",
        quantity: 1,
        color: const Color(0xFFBBDEFB),
      ),
      CartItem(
        name: "Leather boots",
        category: "Footwear",
        price: 120.00,
        originalPrice: 150.00,
        image: "lib/assets/products/product1.png",
        quantity: 1,
        color: const Color(0xFFD7CCC8),
      ),
      CartItem(
        name: "Summer hat",
        category: "Accessories",
        price: 15.50,
        originalPrice: null,
        image: "lib/assets/products/product1.png",
        quantity: 2,
        color: const Color(0xFFFFF9C4),
      ),
    ];
    setState(() {});
  }

  double get subtotal => cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  double get shippingFee => 0.00;
  double get discount => 0.00;
  double get total => subtotal + shippingFee - discount;
  int get totalItems => cartItems.fold(0, (sum, item) => sum + item.quantity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: cartItems.isEmpty ? _buildEmptyState() : _buildCartContent(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[100] ?? Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 50,
              color: Colors.grey[400] ?? Colors.grey,
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Your Cart is empty',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'When you add products,\nthey\'ll appear here',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500] ?? Colors.grey,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartContent() {
    return Column(
      children: [
        // 🛒 Progress Indicator
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Row(
            children: [
              _buildProgressStep(
                icon: Icons.shopping_cart_outlined,
                label: 'Order Registration',
                isActive: true,
                isCompleted: false,
              ),
              _buildProgressLine(true),
              _buildProgressStep(
                icon: Icons.local_shipping_outlined,
                label: 'Delivery Time',
                isActive: false,
                isCompleted: false,
              ),
              _buildProgressLine(false),
              _buildProgressStep(
                icon: Icons.payment_outlined,
                label: 'Payment',
                isActive: false,
                isCompleted: false,
              ),
            ],
          ),
        ),

        // 🛍️ Cart Items list scrollable
        Expanded(
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 90,
                        decoration: BoxDecoration(
                          color: item.color ?? Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: item.image.isNotEmpty
                              ? Image.asset(
                            item.image,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              // Show placeholder icon if image not found
                              return Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  color: Colors.white70,
                                  size: 30,
                                ),
                              );
                            },
                          )
                              : Center(
                            child: Icon(
                              Icons.image,
                              color: Colors.white70,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.more_horiz,
                                  color: Colors.grey[400] ?? Colors.grey,
                                  size: 20,
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              item.category,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[500] ?? Colors.grey,
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '\$${item.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                    if (item.originalPrice != null) ...[
                                      SizedBox(width: 8),
                                      Text(
                                        '\$${item.originalPrice!.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[400] ?? Colors.grey,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (item.quantity > 1) {
                                          setState(() {
                                            item.quantity--;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey[300] ?? Colors.grey),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Icon(Icons.remove, size: 16, color: Colors.grey[600] ?? Colors.grey),
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 28,
                                      alignment: Alignment.center,
                                      child: Text(
                                        '${item.quantity}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item.quantity++;
                                        });
                                      },
                                      child: Container(
                                        width: 28,
                                        height: 28,
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey[300] ?? Colors.grey),
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        child: Icon(Icons.add, size: 16, color: Colors.grey[600] ?? Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),

        // 📌 Fixed Bottom Section
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey[200] ?? Colors.grey)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Discount Code
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 48,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50] ?? Colors.grey[100] ?? Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[200] ?? Colors.grey),
                      ),
                      child: TextField(
                        controller: discountController,
                        decoration: InputDecoration(
                          hintText: 'Enter The Discount Code',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500] ?? Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    height: 48,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // Apply discount
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Apply',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Order Summary
              SizedBox(height: 16),
              _buildSummaryRow('Total ($totalItems items)', '\$${subtotal.toStringAsFixed(2)}', false),
              SizedBox(height: 12),
              _buildSummaryRow('Shipping Fee', '\$${shippingFee.toStringAsFixed(2)}', false),
              SizedBox(height: 12),
              _buildSummaryRow('Discount', '\$${discount.toStringAsFixed(2)}', false),
              _buildDottedDivider(),
              _buildSummaryRow('Total', '\$${total.toStringAsFixed(2)}', true),

              // Checkout Button
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: cartItems.isEmpty
                      ? null
                      : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Proceeding to checkout...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB71C1C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Proceed to Checkout(\$${total.toStringAsFixed(2)})',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressStep({
    required IconData icon,
    required String label,
    required bool isActive,
    required bool isCompleted,
  }) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey[200] ?? Colors.grey,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 20,
            color: isActive ? Colors.white : Colors.grey[500] ?? Colors.grey,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.black : Colors.grey[500] ?? Colors.grey,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Dotted progress line
  Widget _buildProgressLine(bool isActive) {
    return Expanded(
      child: CustomPaint(
        painter: DottedLinePainter(
            color: isActive
                ? (Colors.grey[300] ?? Colors.grey)
                : (Colors.grey[200] ?? Colors.grey)),
        child: SizedBox(height: 2),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String amount, bool isTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.normal,
            color: Colors.black,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  // Dotted divider for summary
  Widget _buildDottedDivider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: CustomPaint(
        painter: DottedLinePainter(color: Colors.grey[400] ?? Colors.grey),
        child: SizedBox(height: 1, width: double.infinity),
      ),
    );
  }
}

// Painter for dotted lines
class DottedLinePainter extends CustomPainter {
  final Color color;
  DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height;
    const dashWidth = 4;
    const dashSpace = 4;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CartItem {
  final String name;
  final String category;
  final double price;
  final double? originalPrice;
  final String image;
  final Color? color;
  int quantity;

  CartItem({
    required this.name,
    required this.category,
    required this.price,
    this.originalPrice,
    required this.image,
    required this.color,
    required this.quantity,
  });
}
