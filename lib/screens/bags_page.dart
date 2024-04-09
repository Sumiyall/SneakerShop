import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_provider.dart';
import 'package:shop_app/screens/cart_item.dart';
import 'hi1.dart';

class BagsPage extends StatelessWidget {
  BagsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().cartItems;
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
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Сагс цэс",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(218, 0, 0, 0),
              ),
            ),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(cartItems[index].imageUrl),
                    title: Text(cartItems[index].name),
                    subtitle: Text('Quantity: 1'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Нийт: \₮50.00', // Set a static total amount
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your logic here
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color.fromARGB(255, 117, 13, 165)),
              ),
              child: Text('Худалдаж авах'),
            ),
          ],
        ),
      ),
    );
  }
}
