import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  String selectedChoice = 'Upcoming';

  final List<Map<String, String>> upcomingNews = [
    {
      'date': 'Apr 17, 2024',
      'name': 'Nike Air Max 90',
      'type': "Men's",
      'price': '200,000₮',
      'imageUrl': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/a0a300da-2e16-4483-ba64-9815cf0598ac/air-max-90-mens-shoes-6n3vKB.png',
    },
    {
      'date': 'Apr 18, 2024',
      'name': 'Adidas Ultraboost',
      'type': "Women's",
      'price': '180,000₮',
      'imageUrl': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/a0a300da-2e16-4483-ba64-9815cf0598ac/air-max-90-mens-shoes-6n3vKB.png',
    },
    // Add more upcoming news items
  ];

  final List<Map<String, String>> popularNews = [
    {
      'date': 'Apr 15, 2024',
      'name': 'Nike Air Jordan 1',
      'type': "Men's",
      'price': '250,000₮',
      'imageUrl': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/a0a300da-2e16-4483-ba64-9815cf0598ac/air-max-90-mens-shoes-6n3vKB.png',
    },
    {
      'date': 'Apr 14, 2024',
      'name': 'Puma Suede Classic',
      'type': "Women's",
      'price': '120,000₮',
      'imageUrl': 'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/a0a300da-2e16-4483-ba64-9815cf0598ac/air-max-90-mens-shoes-6n3vKB.png',
    },
    // Add more popular news items
  ];

  void onChoiceSelected(String choice) {
    setState(() {
      selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 128, 21, 138),
            title: Text(
              "Гутлын дэлгүүр",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            floating: true,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(55),
              child: Container(
                color: Color.fromARGB(255, 128, 21, 138),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search, color: Colors.black, size: 24),
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                  ),
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildChoiceChip('Upcoming'),
                    buildChoiceChip('Popular'),
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final newsItem = selectedChoice == 'Upcoming'
                    ? upcomingNews[index]
                    : popularNews[index];
                return buildNewsCard(
                  newsItem['date']!,
                  newsItem['name']!,
                  newsItem['type']!,
                  newsItem['price']!,
                  newsItem['imageUrl']!,
                );
              },
              childCount: selectedChoice == 'Upcoming'
                  ? upcomingNews.length
                  : popularNews.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChoiceChip(String label) {
    final isSelected = selectedChoice == label;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[200],
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.purple : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: InkWell(
          onTap: () => onChoiceSelected(label),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.purple : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNewsCard(
    String date,
    String name,
    String type,
    String price,
    String imageUrl,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    type,
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}