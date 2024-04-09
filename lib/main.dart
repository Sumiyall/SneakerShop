import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../screens/home_page.dart'; 
import '../../../screens/hi1.dart';

import '../../../screens/cart_item.dart';
import '../../../screens/cart_provider.dart';
// void main() {
//   runApp(MyApp());
// }

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: Login1(), // Change this to HomePage()
    );
  }
}
