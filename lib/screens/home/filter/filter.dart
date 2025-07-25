import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? selectedShop;
  String? selectedCategory;

  RangeValues _priceRange = RangeValues(20, 100);
  final double minPrice = 20;
  final double maxPrice = 100;

  List<String> sizes = ['S', 'M', 'L', 'XL', '2XL'];
  String? selectedSize;

  List<Color> colors = [Colors.blue.shade200, Colors.blue.shade900, Color(0xFFB71C1C), Colors.green, Colors.orange];
  Color? selectedColor;

  int get selectedCount {
    int count = 0;
    if (selectedShop != null) count++;
    if (selectedCategory != null) count++;
    if (selectedSize != null) count++;
    if (selectedColor != null) count++;
    if (_priceRange != RangeValues(minPrice, maxPrice)) count++;
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            Expanded(
              child: Center(
                child: Text("Filter",
                  style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
            ),
            SizedBox(width: 48), // to balance the back button
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Dropdowns
            DropdownButtonFormField<String>(
              value: selectedShop,
              hint: Text("Shops"),
              decoration: _dropdownDecoration(),
              onChanged: (val) => setState(() => selectedShop = val),
              items: ['every shop', 'New Mart', 'Fashion World']
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
            ),
            SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              hint: Text("Category"),
              decoration: _dropdownDecoration(),
              onChanged: (val) => setState(() => selectedCategory = val),
              items: ['Jeans', 'Dresses', 'Tops']
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
            ),
            SizedBox(height: 25),

            // Price Range
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price Range", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            RangeSlider(
              values: _priceRange,
              min: minPrice,
              max: maxPrice,
              activeColor: Color(0xFFB71C1C),
              labels: RangeLabels('\$${_priceRange.start.toStringAsFixed(2)}', '\$${_priceRange.end.toStringAsFixed(2)}'),
              onChanged: (newValues) => setState(() => _priceRange = newValues),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${_priceRange.start.toStringAsFixed(2)}'),
                Text('\$${_priceRange.end.toStringAsFixed(2)}'),
              ],
            ),

            SizedBox(height: 20),

            // Sizes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Size", style: TextStyle(fontWeight: FontWeight.w600)),
                Text("Size Guide", style: TextStyle(color: Color(0xFFB71C1C), fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: sizes.map((size) {
                final bool selected = selectedSize == size;
                return GestureDetector(
                  onTap: () => setState(() => selectedSize = size),
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                      border: selected ? Border.all(color: Colors.green, width: 2) : null,
                    ),
                    child: Text(size, style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Colors
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Color", style: TextStyle(fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 10),
            Row(
              children: colors.map((color) {
                final bool selected = selectedColor == color;
                return GestureDetector(
                  onTap: () => setState(() => selectedColor = color),
                  child: Container(
                    margin: EdgeInsets.only(right: 12),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: selected ? Border.all(color: Colors.black, width: 2) : null,
                    ),
                  ),
                );
              }).toList(),
            ),

            Spacer(),

            // Apply Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // apply filter logic here
                  Navigator.pop(context); // or pass filter values
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB71C1C),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  selectedCount > 0 ? 'Apply Filters ($selectedCount Item\'s)' : 'Apply Filters',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  InputDecoration _dropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }
}
