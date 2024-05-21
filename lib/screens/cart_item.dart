// cart_item.dart

class CartItem {
  final String name;
  final String imageUrl;
  final String type;
  final int? price;

  CartItem({
    required this.name,
    required this.imageUrl,
    required this.type,
    this.price, String? size,
  });
}
