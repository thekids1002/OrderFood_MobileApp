class Product {
  final String imagePath;
  final String name;
  final String price;

  Product({required this.imagePath, required this.name, required this.price});

  // Hàm chuyển từ JSON thành đối tượng Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      imagePath: json['imagePath'],
      name: json['name'],
      price: json['price'],
    );
  }
}
