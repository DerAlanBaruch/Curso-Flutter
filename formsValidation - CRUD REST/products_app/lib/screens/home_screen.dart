import 'package:flutter/material.dart';
import 'package:products_app/screens/screens.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productServices = Provider.of<ProductServices>(context);
    final authService = Provider.of<AuthService>(context, listen: false);
    if (productServices.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
        actions: [
          IconButton(
              onPressed: () async {
                await authService.logout();
                Navigator.pushReplacementNamed(context, 'login');
              },
              icon: const Icon(Icons.logout))
        ],
      ),
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
        onPressed: () {
          productServices.selectedProduct =
              Product(available: false, name: '', price: 0.0);
          Navigator.pushNamed(context, 'product');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
