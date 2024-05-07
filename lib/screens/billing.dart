import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class BillingPage extends StatefulWidget {
  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.cartItems;

    double subtotal = cartItems.fold(0, (sum, item) => sum + (item.price ?? 0));
    double shippingCost = 10.0; // Example shipping cost
    double tax = subtotal * 0.1; // Example tax calculation (10% of subtotal)
    double estimatedTotal = subtotal + shippingCost + tax;

    return Scaffold(
      appBar: AppBar(
        title: Text('Billing'),
        backgroundColor: Color.fromARGB(255, 116, 25, 134),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Items',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        item.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.name),
                      subtitle: Text('Price: ${item.price ?? "N/A"}'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Payment',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildPaymentImage('https://w7.pngwing.com/pngs/553/672/png-transparent-bank-of-mongolia-khan-bank-automated-teller-machine-khanda-leaf-branch-payment-thumbnail.png', 'Bank 1'),
                      buildPaymentImage('https://is5-ssl.mzstatic.com/image/thumb/Purple124/v4/4a/60/ed/4a60ed7e-3f02-5db7-05bb-2162a944c1d6/source/512x512bb.jpg', 'Bank 2'),
                      buildPaymentImage('https://cdn6.aptoide.com/imgs/0/6/d/06df97a06fbc7622a775a7c414b69e87_icon.png', 'Bank 3'),
                      buildPaymentImage('https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/6d/5e/fe/6d5efe98-d03c-0eb5-0550-661653e184cf/AppIcon-0-0-1x_U007emarketing-0-7-0-0-85-220.png/230x0w.webp', 'Bank 4'),
                      buildPaymentImage('https://upload.wikimedia.org/wikipedia/commons/a/a4/Paypal_2014_logo.png', 'Bank 5'),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: selectedPayment != null
                        ? () {
                            // Handle payment selection
                            print('Selected Payment: $selectedPayment');
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Select Payment',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal'),
                Text('$subtotal₮'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Shipping'),
                Text('$shippingCost₮'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax'),
                Text('$tax₮'),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Estimated Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$estimatedTotal₮',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentImage(String imageUrl, String bankName) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = bankName;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedPayment == bankName ? Colors.purple : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}