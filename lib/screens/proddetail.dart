import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_item.dart';
import 'package:shop_app/screens/cart_provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            backgroundColor: Color.fromARGB(255, 128, 21, 138),
            title: Text(
              "Бүтээгдэхүүний дэлгэрэнгүй",
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(product['imageUrl']),
                  SizedBox(height: 16),
                  Text(
                    product['name'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Type: ${product['type']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  product['price'] != null
                      ? Text(
                          'Price: ${product['price']}₮',
                          style: TextStyle(fontSize: 16),
                        )
                      : Text(
                          'Price on request',
                          style: TextStyle(fontSize: 16),
                        ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final cartProvider = context.read<CartProvider>();
                      cartProvider.addToCart(
                        CartItem(
                          name: product['name'],
                          imageUrl: product['imageUrl'],
                          type: product['type'],
                          price: product['price'],
                        ),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: Text('Сагсанд нэмэх'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
