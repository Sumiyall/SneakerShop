import 'package:flutter/material.dart';
import 'package:shop_app/screens/categories.dart';
import 'bags_page.dart';
import 'shop_page.dart';
import 'categories.dart';
import 'profile_page.dart';
import 'billing.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> pages = [
    const ShopPage(),
    BagsPage(),
   
    BillingPage(),
    const ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Color.fromARGB(255, 116, 25, 134),
        onTap: _onTabTapped,
        items: [
          _buildNavigationBarItem(Icons.window, 'Дэлгүүр', 0),
          _buildNavigationBarItem(Icons.shopping_basket_outlined, 'Сагс', 1),
          // _buildNavigationBarItem(Icons.home_outlined, 'Категориуд', 2),
          _buildNavigationBarItem(Icons.card_travel, 'Хэрэглэгч', 2),
          _buildNavigationBarItem(Icons.person, 'Billing', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavigationBarItem(
    IconData icon,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
    icon: Container(
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.white : Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(12),
      child: Icon(
        icon,
        color: _currentIndex == index
            ? Color.fromARGB(255, 116, 25, 134)
            : Colors.white,
        size: 32,
      ),
    ),
    label: '',
  );
}
}