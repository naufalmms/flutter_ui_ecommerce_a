// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final int id;
  final String productName;
  final String category;
  final String photo;
  final String description;
  final double price;
  int quantity;
  Product({
    required this.id,
    required this.productName,
    required this.category,
    required this.photo,
    required this.description,
    required this.price,
    required this.quantity,
  });
}
