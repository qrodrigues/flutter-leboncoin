class Product {
  Product({
    required this.title,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(dynamic json) {
    return Product(
      title: json['titre'] as String,
      price: double.parse(json['prix'].toString()),
      description: json['description'] as String,
    );
  }

  final String title;
  final double price;
  final String description;
}
