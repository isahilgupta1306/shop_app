import 'package:flutter/material.dart';
import '../provider/product.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return Card(
      elevation: 14,
      //shadowColor: Colors.purpleAccent,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        splashColor: Theme.of(context).accentColor,
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          footer: GridTileBar(
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white60,
                ),
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              ),
            ),
            backgroundColor: Colors.black54,
            title: Text(
              product.title,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white60,
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
