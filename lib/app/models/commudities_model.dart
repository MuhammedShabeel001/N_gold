// lib/models/commodity_model.dart

class Commodity {
  final String name;
  
  // Default values for display purposes since the API only provides names
  final double price;
  final double change;
  final String imageUrl;
  
  Commodity({
    required this.name,
    this.price = 0.0,
    this.change = 0.0,
    this.imageUrl = '',
  });
  
  factory Commodity.fromString(String name) {
    return Commodity(
      name: name,
    );
  }
}