/// Immutable data model representing a single product returned by the API.
class ProductModel {
  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
  });

  final int id;
  final String name;
  final double price;
  final double rating;
  final String image;

  /// Deserialises a single product JSON object.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      // Price may arrive as int or double
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] as String,
    );
  }

  @override
  String toString() =>
      'ProductModel(id: $id, name: $name, price: $price, rating: $rating)';
}