import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromARGB(255, 128, 21, 138),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                buildSettingItem(Icons.phone_android, 'Layout', 'Regular >'),
                buildSettingItem(Icons.location_on, 'Location', 'MN >'),
                buildSettingItem(Icons.notifications, 'Notifications', null),
                buildSettingItem(Icons.currency_exchange, 'Change currency', '₮ >'),
                buildSettingItem(Icons.format_size, 'Change size', '8.0 >'),
                buildSettingItem(Icons.contact_support, 'Contact us', null),
                buildSettingItem(Icons.share, 'Share this app', null),
                buildSettingItem(Icons.star_rate, 'Rate us', null),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSettingItem(IconData icon, String title, String? trailing) {
    return InkWell(
      onTap: () {
        // Handle setting item tap
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Color.fromARGB(255, 128, 21, 138),
              size: 24,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
            ),
            if (trailing != null)
              Text(
                trailing,
                style: TextStyle(color: Colors.grey),
              ),
            if (trailing == null)
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}