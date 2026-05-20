class Product {
  String id;
  String name;
  String image;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  static final List<Product> products = [
    Product(
      id: "P01",
      name: "Laptop",
      image: "laptop.png",
      price: 1500,
    ),
    Product(
      id: "P02",
      name: "Phone",
      image: "phone.png",
      price: 800,
    ),
    Product(
      id: "P03",
      name: "Headphone",
      image: "headphone.png",
      price: 200,
    ),
  ];

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: (json['price'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
      };

  static void add(Product product) => products.add(product);

  static void edit(Product updatedProduct) {
    final index =
        products.indexWhere((p) => p.id == updatedProduct.id);

    if (index != -1) {
      products[index] = updatedProduct;
    }
  }

  static List<Product> searchByName(String keyword) =>
      products.where((p) =>
          p.name.toLowerCase().contains(keyword.toLowerCase()))
      .toList();

  static List<Product> searchByPrice(double min, double max) =>
      products
          .where((p) => p.price >= min && p.price <= max)
          .toList();

  static Product? findById(String id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  static void increasePrice([double percent = 10]) {
    for (var product in products) {
      product.price += product.price * percent / 100;
    }
  }

  @override
  String toString() =>
      "ID: $id - Name: $name - Price: \$${price.toStringAsFixed(2)}";
}