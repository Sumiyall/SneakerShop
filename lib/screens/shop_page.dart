import 'package:flutter/material.dart';
import 'hi1.dart';
import 'proddetail.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String selectedChoice = "Men's";

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
              preferredSize: Size.fromHeight(40),
              child: Container(
                color: Color.fromARGB(255, 128, 21, 138),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white24,
                    prefixIcon:
                        Icon(Icons.search, color: Colors.white, size: 20),
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(width: 16),
                        ChoiceChip(
                          label: Text(
                            "Men's",
                            style: TextStyle(
                              color: selectedChoice == "Men's"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedChoice == "Men's",
                          onSelected: (selected) => onChoiceSelected("Men's"),
                          backgroundColor: Colors.grey[300],
                          selectedColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        SizedBox(width: 8),
                        ChoiceChip(
                          label: Text(
                            "Women's",
                            style: TextStyle(
                              color: selectedChoice == "Women's"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedChoice == "Women's",
                          onSelected: (selected) => onChoiceSelected("Women's"),
                          backgroundColor: Colors.grey[300],
                          selectedColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        SizedBox(width: 8),
                        ChoiceChip(
                          label: Text(
                            "Kid's",
                            style: TextStyle(
                              color: selectedChoice == "Kid's"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedChoice == "Kid's",
                          onSelected: (selected) => onChoiceSelected("Kid's"),
                          backgroundColor: Colors.grey[300],
                          selectedColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        SizedBox(width: 8),
                        ChoiceChip(
                          label: Text(
                            "Brands",
                            style: TextStyle(
                              color: selectedChoice == "Brands"
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: selectedChoice == "Brands",
                          onSelected: (selected) => onChoiceSelected("Brands"),
                          backgroundColor: Colors.grey[300],
                          selectedColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 2,
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  SneakerCart(selectedChoice: selectedChoice),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SneakerCart extends StatelessWidget {
  final String selectedChoice;

  SneakerCart({required this.selectedChoice});

  final List<Map<String, dynamic>> sneakers = [
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl':
          'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl':
          'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl':
          'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl':
          'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl':
          'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl':
          'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl':
          'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    if (selectedChoice == "Brands") {
      // Display brand logos or cards
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          BrandCard(
            brandName: "Nike",
            logoUrl:
                "https://purepng.com/public/uploads/large/purepng.com-nike-logologobrand-logoiconslogos-251519940082eoxxs.png",
          ),
          BrandCard(
            brandName: "Adidas",
            logoUrl:
                "https://purepng.com/public/uploads/large/21502362475r8bjrgyzs78go6s1hjhf8hfz22xjolzbtlkj7loqtg18wsxpb6l72dmqxhn1regqpjjscyuppavtcnacyuummijt8cmz7wj1ehjx.png",
          ),
          BrandCard(
            brandName: "Parker",
            logoUrl:
                "https://purepng.com/public/uploads/large/purepng.com-parker-hannifin-logologobrand-logoiconslogos-2515199387710dv6x.png",
          ),
        ],
      );
    } else {
      // Filter sneakers based on the selected choice
      List<Map<String, dynamic>> filteredSneakers = sneakers
          .where((sneaker) =>
              selectedChoice == "Men's" && sneaker['type'] == 'Эрэгтэй' ||
              selectedChoice == "Women's" && sneaker['type'] == 'Эмэгтэй' ||
              selectedChoice == "Kid's" && sneaker['type'] == 'Хүүхэд')
          .toList();

      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: filteredSneakers.map((sneaker) {
          return Container(
            height: 300,
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      sneaker['imageUrl']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(sneaker['name']!),
                        Text(sneaker['type']!),
                        sneaker['price'] != null
                            ? Text('${sneaker['price']}₮')
                            : Text('Price on request'),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailsPage(product: sneaker),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                          ),
                          child: sneaker['price'] != null
                              ? Text('Дэлгэрэнгүй')
                              : Text('Дэлгэрэнгүй'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      );
    }
  }
}

class BrandCard extends StatelessWidget {
  final String brandName;
  final String logoUrl;

  const BrandCard({required this.brandName, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              logoUrl,
              height: 80,
              width: 80,
            ),
            SizedBox(width: 16),
            Text(
              brandName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
