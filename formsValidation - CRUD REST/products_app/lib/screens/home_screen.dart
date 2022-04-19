import 'package:flutter/material.dart';
import 'package:products_app/screens/screens.dart';
import 'package:products_app/services/product_service.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productServices = Provider.of<ProductServices>(context);
    if (productServices.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(title: const Text('Productos')),
      body: ListView.builder(
          itemCount: productServices.products.length,
          itemBuilder: (_, int index) => GestureDetector(
              onTap: () {
                productServices.selectedProduct =
                    productServices.products[index].copy();
                Navigator.pushNamed(context, 'product');
              },
              child: ProductCard(
                product: productServices.products[index],
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
