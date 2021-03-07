import 'package:flutter/foundation.dart ';

class CartItems {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItems({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItems> _items;

  Map<String, CartItems> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
        productId,
        (existingCartItem) => CartItems(
          id: existingCartItem.id,
          title: existingCartItem.title,
          quantity: existingCartItem.quantity,
          price: existingCartItem.price + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItems(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
  }
}
