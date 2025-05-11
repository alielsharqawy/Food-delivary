class Category {
  final String label;
  final String emoji;

  Category({required this.label, required this.emoji});
}

class Product {
  final String name;
  final String imageUrl;
  final double rating;
  final String time;
  final String price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.time,
    required this.price,
  });
}