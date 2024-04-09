import 'package:flutter/material.dart';
import 'bags_page.dart';
import 'shop_page.dart';
import 'favorite_page.dart';
import 'profile_page.dart';
import 'hi1.dart';

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
    const FavoritePage(),
    const ProfilePage()
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
        selectedItemColor: Color.fromARGB(255, 116, 25, 134),
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopify_sharp),
            label: 'Дэлгүүр',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_sharp),
            label: 'Сагс',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Категориуд',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Хэрэглэгч',
          ),
        ],
      ),
    );
  }
}
