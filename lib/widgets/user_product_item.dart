import 'package:flutter/material.dart';
import '../screens/edit_products_screen.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  UserProductItem(this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.purple[300],
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(EditProductScreen.routeName);
                }),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
