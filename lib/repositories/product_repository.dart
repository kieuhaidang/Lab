import 'dart:async';

import '../models/product.dart';

// Repository class
class ProductRepository {
  // Internal product list
  final List<Product> _products = [];

  // Broadcast stream for real-time updates
  final StreamController<Product> _controller =
      StreamController<Product>.broadcast();

  // Simulate fetching data from API/database
  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 2));

    return _products;
  }

  // Stream listener
  Stream<Product> liveAdded() {
    return _controller.stream;
  }

  // Add product
  void addProduct(Product product) {
    _products.add(product);

    // Emit new product
    _controller.add(product);
  }

  // Close stream
  void dispose() {
    _controller.close();
  }
}