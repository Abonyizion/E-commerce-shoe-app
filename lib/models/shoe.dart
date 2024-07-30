

class Shoe {
  final int id;
  final String name;
  final double price;
  final String imagePath;
  final String description;
   int quantity;

  Shoe({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    this.quantity = 1,
  });

}
