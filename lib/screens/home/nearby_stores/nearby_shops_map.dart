import 'package:flutter/material.dart';
import 'nearby_shops_list.dart';

class NearbyShopsMap extends StatelessWidget {
  const NearbyShopsMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Shops"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Stack(
        children: [
          // Placeholder Map
          Container(
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.map, size: 120, color: Colors.grey),
            ),
          ),
          // Floating shop preview card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[300],
                    ),
                    child: const Icon(Icons.store, color: Colors.black54),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Test Shop", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("⭐ 4.6  •  Open", style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const NearbyShopsList()),
                      );
                    },
                    child: const Text("Go To List"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
