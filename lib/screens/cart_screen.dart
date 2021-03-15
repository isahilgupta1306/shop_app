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
                  OrderButton(cart: cart),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            'Swipe left to remove the product',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black87),
          ),
          SizedBox(
            height: 8,
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

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              await Provider.of<Orders>(context, listen: false).addOrder(
                widget.cart.items.values.toList(),
                widget.cart.totalAmount,
              );
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
            },
      child: _isLoading
          ? CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.purple),
            )
          : Text('ORDER NOW'),
      style: ButtonStyle(),
    );
  }
}
