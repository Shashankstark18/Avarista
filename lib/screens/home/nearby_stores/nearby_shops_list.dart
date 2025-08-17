import 'package:flutter/material.dart';
import 'shop_detail_screen.dart';

class NearbyShopsList extends StatelessWidget {
  const NearbyShopsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Shops"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 2, // placeholder shops
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: const Icon(Icons.store, color: Colors.black54),
              ),
              title: Text("Shop ${index + 1}"),
              subtitle: const Text("⭐ 4.5 • Open"),
              trailing: TextButton(
                child: const Text("Go To Map"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ShopDetailScreen()),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
