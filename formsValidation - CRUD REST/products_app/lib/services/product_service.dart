import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class ProductServices extends ChangeNotifier {
  final String _baseURL = 'project-samples-42a32-default-rtdb.firebaseio.com';
  final List<Product> products = [];
  bool isLoading = true;

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
}
