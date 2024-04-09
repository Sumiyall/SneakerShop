import 'package:flutter/material.dart';
import 'hi1.dart';
import 'proddetail.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login1()),
                );
              },
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            backgroundColor: Color.fromARGB(255, 128, 21, 138),
            title: Text(
              "Гутлын дэлгүүр",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            floating: true,
            pinned: true,
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Sneakers',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  SneakerCart(),
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
  final List<Map<String, dynamic>> sneakers = [
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl': 'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl': 'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl': 'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl': 'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl': 'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl': 'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
    {
      'name': 'Nike AirForce 1',
      'type': 'Эрэгтэй',
      'price': 250000,
      'imageUrl': 'https://media.gq.com/photos/5e4c2c5440e46c00081a1de5/16:9/w_1280,c_limit/3x2.jpg',
    },
  ];

 @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: sneakers.map((sneaker) {
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
                              builder: (context) => ProductDetailsPage(product: sneaker),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
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