import 'models/product.dart';
import 'repositories/product_repository.dart';

void main() async {
  // Create repository
  ProductRepository repository = ProductRepository();

  // Listen to real-time added products
  repository.liveAdded().listen((product) {
    print('New product added: $product');
  });

  // Add products
  repository.addProduct(
    Product(id: 1, name: 'Laptop', price: 1200),
  );

  repository.addProduct(
    Product(id: 2, name: 'Mouse', price: 25),
  );

  repository.addProduct(
    Product(id: 3, name: 'Keyboard', price: 80),
  );

  print('\nFetching all products...\n');

  // Get all products
  List<Product> products = await repository.getAll();

  // Print product list
  print('All Products:');
  for (var product in products) {
    print(product);
  }

  // Close stream
  repository.dispose();
}