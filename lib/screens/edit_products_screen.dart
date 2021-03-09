import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/product-editScreen';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Added Product'),
      ),
      body: Form(
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
