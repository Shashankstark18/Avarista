import 'package:flutter/material.dart';

class CategoryItemsScreen extends StatefulWidget {
  final String categoryName;
  final List<Map<String, dynamic>> items; // Items for that category

  const CategoryItemsScreen({
    Key? key,
    required this.categoryName,
    required this.items,
  }) : super(key: key);

  @override
  _CategoryItemsScreenState createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  String _sortOption = "Default"; // selected sort option
  late List<Map<String, dynamic>> _displayedItems;

  @override
  void initState() {
    super.initState();
    _displayedItems = List.from(widget.items);
  }

  void _sortItems(String option) {
    setState(() {
      _sortOption = option;
      if (option == "Rating (High to Low)") {
        _displayedItems.sort((a, b) => b["rating"].compareTo(a["rating"]));
      } else if (option == "Rating (Low to High)") {
        _displayedItems.sort((a, b) => a["rating"].compareTo(b["rating"]));
      } else if (option == "Top Reviewed") {
        _displayedItems.sort((a, b) => b["reviews"].compareTo(a["reviews"]));
      } else {
        _displayedItems = List.from(widget.items); // reset
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                "${_displayedItems.length} Items\nAvailable",
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Sort Dropdown
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: PopupMenuButton<String>(
                onSelected: _sortItems,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.sort, size: 18, color: Colors.grey),
                      SizedBox(width: 6),
                      Text("Sort", style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem(value: "Rating (High to Low)", child: Text("Rating (High to Low)")),
                  const PopupMenuItem(value: "Rating (Low to High)", child: Text("Rating (Low to High)")),
                  const PopupMenuItem(value: "Top Reviewed", child: Text("Top Reviewed")),
                ],
              ),
            ),
          ),

          // Grid of items
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 3 / 3.5,
              ),
              itemCount: _displayedItems.length,
              itemBuilder: (context, index) {
                final item = _displayedItems[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shop Image
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          item["image"],
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          item["name"],
                          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: Color(0xFFFFA133)),
                            const SizedBox(width: 4),
                            Text(item["rating"].toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
