import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location_permission_screen.dart';
import 'nearby_shops_map.dart';

class NearbyShopsWrapper extends StatefulWidget {
  const NearbyShopsWrapper({Key? key}) : super(key: key);

  @override
  State<NearbyShopsWrapper> createState() => _NearbyShopsWrapperState();
}

class _NearbyShopsWrapperState extends State<NearbyShopsWrapper> {
  bool? hasPermission;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      setState(() => hasPermission = true);
    } else {
      setState(() => hasPermission = false);
    }
  }

  Future<void> _requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // 👇 If granted, navigate directly to map
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NearbyShopsMap()),
      );
    } else {
      // 👇 If denied, stay on the screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Location permission denied")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hasPermission == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return hasPermission!
        ? const NearbyShopsMap()
        : LocationPermissionScreen(onAllow: _requestPermission);
  }
}
