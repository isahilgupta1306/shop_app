import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/user_products_screen.dart';
import '../screens/orders_screen.dart';
import '../provider/auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(
            color: Colors.purple[600],
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.shop_outlined,
              color: Colors.purple[600],
            ),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(
            color: Colors.purple[600],
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.payment_outlined,
              color: Colors.purple[600],
            ),
            title: Text('Order'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          Divider(
            color: Colors.purple[600],
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.edit_outlined,
              color: Colors.purple[600],
            ),
            title: Text('Manage Order'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductScreen.routeName);
            },
          ),
          Divider(
            color: Colors.purple[600],
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.purple[600],
            ),
            title: Text('LogOut'),
            onTap: () {
              Navigator.of(context).pop();
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
