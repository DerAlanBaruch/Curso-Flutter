import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class ProductServices extends ChangeNotifier {
  final String _baseURL = 'project-samples-42a32-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;
  bool isSaving = true;
  Product? selectedProduct;

  ProductServices() {
    loadProducts();
  }

  Future<List<Product>> loadProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseURL, 'products.json');
    final res = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(res.body);
    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      products.add(tempProduct);
    });
    isLoading = false;
    notifyListeners();
    return products;
  }

  Future createOrUpdateProduct(Product product) async {
    isSaving = true;
    notifyListeners();
    if (product.id == null) {
      await createProduct(product);
    } else {
      await updateProduct(product);
    }
    isSaving = false;
    notifyListeners();
  }

  Future updateProduct(Product product) async {
    final url = Uri.https(_baseURL, 'products/${product.id}.json');
    final res = await http.put(url, body: product.toJson());
    final decodedData = res.body;
    print(decodedData);
    final index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;
    return product.id!;
  }

  Future createProduct(Product product) async {
    final url = Uri.https(_baseURL, 'products.json');
    final res = await http.post(url, body: product.toJson());
    final decodedData = json.decode(res.body);
    product.id = decodedData['name'];
    products.add(product);
    return product.id!;
  }
}
