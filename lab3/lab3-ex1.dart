import 'dart:async';

Future<void> main() async {
  ProductRepository repo = ProductRepository();

  repo.liveAdded().listen((product) {
    print("Live product: ${product.name} - ${product.price}");
  });

  List<Product> products = await repo.getAll();

  for (var p in products) {
    print("${p.name} - \$${p.price}");
  }

  repo.addProduct(Product(3, "Tablet", 300.0));
}

class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);
}

class ProductRepository {
  final List<Product> _products = [
    Product(1, "Laptop", 1000.0),
    Product(2, "Phone", 500.0),
  ];

  final StreamController<Product> _controller =
  StreamController<Product>.broadcast();

  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(seconds: 1));
    return _products;
  }

  Stream<Product> liveAdded() {
    return _controller.stream;
  }

  void addProduct(Product product) {
    _products.add(product);
    _controller.add(product);
  }
}