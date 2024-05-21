import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/cart_item.dart';
import 'package:shop_app/screens/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? selectedSize;

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
            centerTitle: true,
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product['name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 128, 21, 138),
                    ),
                  ),
                  SizedBox(height: 16),
                  Image.network(widget.product['imageUrl']),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildImageThumbnail(widget.product['imageUrl']),
                        buildImageThumbnail(widget.product['imageUrl']),
                        buildImageThumbnail(widget.product['imageUrl']),
                        buildImageThumbnail(widget.product['imageUrl']),
                        // buildImageThumbnail(widget.product['imageUrl']),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Type: ${widget.product['type']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: widget.product['price'] != null
                        ? Text(
                            'Price: ${widget.product['price']}₮',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          )
                        : Text(
                            'Price on request',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                  ),
                 SizedBox(height: 16),
Text(
  'Choose Size',
  style: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
),
SizedBox(height: 8),
Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSizeChip('28'),
        buildSizeChip('30'),
        buildSizeChip('32'),
        buildSizeChip('34'),
      ],
    ),
    SizedBox(height: 8),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSizeChip('36'),
        buildSizeChip('38'),
        buildSizeChip('40'),
        buildSizeChip('42'),
      ],
    ),
  ],
),
SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed: () {
            final cartProvider = context.read<CartProvider>();
            cartProvider.addToCart(
              CartItem(
                name: widget.product['name'],
                imageUrl: widget.product['imageUrl'],
                type: widget.product['type'],
                price: widget.product['price'],
                size: selectedSize,
              ),
            );
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Сагсанд нэмэх',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }

  Widget buildImageThumbnail(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildSizeChip(String size) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    child: ChoiceChip(
      label: Text(
        size,
        style: TextStyle(
          color: selectedSize == size ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      selected: selectedSize == size,
      onSelected: (selected) {
        setState(() {
          selectedSize = selected ? size : null;
        });
      },
      backgroundColor: Colors.grey[200],
      selectedColor: Colors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: selectedSize == size ? Colors.purple : Colors.grey[400]!,
          width: 2,
        ),
      ),
      elevation: 2,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );
}
}