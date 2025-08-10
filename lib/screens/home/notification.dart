import 'package:flutter/material.dart';
class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationItem> notifications = [];

  @override
  void initState() {
    super.initState();
    // Uncomment the line below to see populated state
    loadNotifications();
  }

  void loadNotifications() {
    notifications = [
      NotificationItem(
          title: "Avarista",
          message: "Product successfully added to cart\nGo to shopping cart to complete.",
          time: "2025.08.11",
          isToday: true
      ),
      NotificationItem(
          title: "Avarista",
          message: "Product successfully added to cart\nGo to shopping cart to complete.",
          time: "2025.08.11",
          isToday: true
      ),
      NotificationItem(
          title: "Avarista",
          message: "Product successfully added to cart\nGo to shopping cart to complete.",
          time: "2025.08.10",
          isToday: false
      ),
      NotificationItem(
          title: "Avarista",
          message: "Product successfully added to cart\nGo to shopping cart to complete.",
          time: "2025.08.10",
          isToday: false
      ),
      NotificationItem(
          title: "Avarista",
          message: "Product successfully added to cart\nGo to shopping cart to complete.",
          time: "2025.08.10",
          isToday: false
      ),
      NotificationItem(
          title: "Avarista",
          message: "Product successfully added to cart\nGo to shopping cart to complete.",
          time: "2025.08.10",
          isToday: false
      ),
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: notifications.isEmpty ? _buildEmptyState() : _buildNotificationsList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.notifications_outlined,
              size: 40,
              color: Colors.grey[400],
            ),
          ),
          SizedBox(height: 24),
          Text(
            'You haven\'t gotten any\nnotification yet',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Don\'t wait! You won\'t miss something\nfrom the app!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList() {
    List<NotificationItem> todayNotifications = notifications.where((n) => n.isToday).toList();
    List<NotificationItem> yesterdayNotifications = notifications.where((n) => !n.isToday).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          if (todayNotifications.isNotEmpty) ...[
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            ...todayNotifications.map((notification) => _buildNotificationCard(notification)),
          ],
          if (yesterdayNotifications.isNotEmpty) ...[
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Yesterday',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: yesterdayNotifications.map((notification) => _buildNotificationCard(notification)).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildNotificationCard(NotificationItem notification) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[200]!, width: 1),
            ),
            child: Center(
              child: Image.asset(
                'lib/assets/avarista.png', // Change to your actual logo path
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.title,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      notification.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  notification.message,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    height: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String message;
  final String time;
  final bool isToday;

  NotificationItem({
    required this.title,
    required this.message,
    required this.time,
    required this.isToday,
  });
}