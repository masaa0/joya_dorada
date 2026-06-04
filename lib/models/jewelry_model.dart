// one product in the catalog (title, price, image, favorite flag...)
class JewelryModel {
  final String title;
  final String description;
  final double price;
  final String image;
  final String category;
  final String material;
  final bool isFeatured;
  bool isFavorite;
  bool isReserved;

  JewelryModel({
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.material,
    this.isFeatured = false,
    this.isFavorite = false,
    this.isReserved = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  void toggleReserved() {
    isReserved = !isReserved;
  }
}
