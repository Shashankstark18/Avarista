import 'package:flutter/material.dart';

class LocationPermissionScreen extends StatelessWidget {
  final VoidCallback onAllow; // 👈 this is required now

  const LocationPermissionScreen({
    super.key,
    required this.onAllow,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_on, size: 100, color: Colors.red),
              const SizedBox(height: 20),
              const Text(
                "We need your location to show nearby shops",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),

              // 👇 Use the passed callback
              ElevatedButton(
                onPressed: onAllow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Allow Location Access"),
              ),
              TextButton(
                onPressed: () {
                  // Handle "Enter manually" (optional)
                },
                child: const Text("Enter place manually"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
