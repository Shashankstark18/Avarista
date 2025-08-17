import 'package:flutter/material.dart';

class ShopDetailScreen extends StatelessWidget {
  const ShopDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Details"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gallery placeholder
            Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300],
              ),
              child: const Center(child: Text("Gallery Placeholder")),
            ),
            const SizedBox(height: 16),

            const Text("Test Shop", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("⭐ 4.5 • 124 Followers"),
            const SizedBox(height: 10),

            const Text("About", style: TextStyle(fontWeight: FontWeight.w600)),
            const Text("This is a placeholder description about the shop."),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA6192E),
                foregroundColor: Colors.white,
              ),
              child: const Text("Follow the Store"),
            ),
          ],
        ),
      ),
    );
  }
}
