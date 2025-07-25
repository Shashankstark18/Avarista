import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  String _currentSearch = '';
  bool _showKeyboard = false;
  List<String> _recentSearches = [];
  List<Map<String, dynamic>> _results = [];
  bool _searched = false;

  final List<Map<String, dynamic>> allResults = [
    {
      'name': 'Jeans',
      'price': '\$69.10',
      'image': 'lib/assets/products/product1.png',
    },
    {
      'name': 'name shop',
      'image': 'lib/assets/products/product1.png',
    },
    {
      'name': 'Uniform',
      'price': '\$49.90',
      'image': 'lib/assets/products/product1.png',
    },
  ];

  void _performSearch() {
    String query = _searchController.text.trim().toLowerCase();
    setState(() {
      _searched = true;
      _showKeyboard = false;
      _results = allResults.where((item) => item['name'].toString().toLowerCase().contains(query)).toList();
      if (query.isNotEmpty && !_recentSearches.contains(query)) {
        _recentSearches.insert(0, query);
      }
    });
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _currentSearch = _searchController.text;
      });
    });
  }

  Widget _buildStatusBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          Expanded(
            child: Center(
              child: Text('Search',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black)),
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300, width: 1),
              ),
              child: TextField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _performSearch(),
                onTap: () => setState(() => _showKeyboard = true),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 10),
                    child: Image.asset(
                      'lib/assets/avarista.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.mic, color: Colors.grey.shade600, size: 20),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.camera_alt, color: Colors.grey.shade600, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches() {
    if (_recentSearches.isEmpty) return SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Searches', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              GestureDetector(
                onTap: () => setState(() => _recentSearches.clear()),
                child: Text('Clear All', style: TextStyle(color: Color(0xFFA6192E), fontWeight: FontWeight.w900)),
              ),
            ],
          ),
          SizedBox(height: 10),
          ..._recentSearches.map((s) => Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _searchController.text = s;
                    _performSearch();
                  },
                  child: Text(s, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 18, color: Colors.grey),
                  onPressed: () => setState(() => _recentSearches.remove(s)),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: _results.map((result) {
          return Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFF7F8F8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: result['image'] != null && result['image']!.isNotEmpty
                      ? result['image'].toString().startsWith('http')
                      ? Image.network(
                    result['image'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    result['image'],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  )
                      : Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[300],
                    child: Icon(Icons.image, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        result['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4A4A4A),
                        ),
                      ),
                      if (result['price'] != null) SizedBox(height: 6),
                      if (result['price'] != null)
                        Text(
                          result['price'],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2C1A4C),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNoResults() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          Icon(Icons.search, size: 80, color: Colors.grey[400]),
          SizedBox(height: 20),
          Text('No Result Found',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey[700])),
          SizedBox(height: 10),
          Text('Try a similar word or something\nmore general',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[500], height: 1.5))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool hasResults = _results.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildStatusBar(),
          _buildHeader(),
          _buildSearchBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (_currentSearch.isEmpty && _recentSearches.isNotEmpty)
                    _buildRecentSearches(),
                  if (_currentSearch.isNotEmpty && hasResults)
                    _buildSearchResults(),
                  if (_searched && _currentSearch.isNotEmpty && !hasResults)
                    _buildNoResults(),
                ],
              ),
            ),
          ),
          Container(
            height: 20,
            child: Center(
              child: Container(
                width: 134,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
