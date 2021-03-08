import 'package:flutter/material.dart';
import '../widgets/cart_item.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart' show Cart;
import '../provider/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart-details';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart items'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 4,
            shadowColor: Colors.purple[200],
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Consumer<Cart>(
                    builder: (_, totalAmt, no) => Chip(
                      backgroundColor: Colors.purple[50],
                      label: Text(
                        'INR ${totalAmt.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clear();
                    },
                    child: Text('ORDER NOW'),
                    style: ButtonStyle(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                  cart.items.values.toList()[i].id,
                  cart.items.keys.toList()[i],
                  cart.items.values.toList()[i].price,
                  cart.items.values.toList()[i].quantity,
                  cart.items.values.toList()[i].title),
            ),
          )
        ],
      ),
    );
  }
}
