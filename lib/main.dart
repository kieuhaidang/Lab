import 'models/product.dart';

void main() {
  print("=== Danh sách ban đầu ===");
  Product.products.forEach(print);

  Product.add(
    Product(
      id: "P04",
      name: "Mouse",
      image: "mouse.png",
      price: 100,
    ),
  );

  Product.edit(
    Product(
      id: "P02",
      name: "IPhone 15",
      image: "iphone15.png",
      price: 1200,
    ),
  );

  print("\n=== Search Name ===");
  Product.searchByName("phone").forEach(print);

  print("\n=== Find By ID ===");
  print(Product.findById("P02"));

  Product.increasePrice();

  print("\n=== Sau khi tăng giá 10% ===");
  Product.products.forEach(print);
}