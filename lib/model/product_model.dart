class GroceryProduct {
  String name;
  String image;
  String price;
  String quantity;
  String description;

  GroceryProduct({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'description': description,
    };
  }

  factory GroceryProduct.fromMap(Map<dynamic, dynamic> map) {
    return GroceryProduct(
      name: map['name'] ?? "Hello",
      image: map['image'] ?? "hello Image",
      price: map['price']?.toDouble() ?? "0.0",
      quantity: map['quantity'] ?? "0",
      description: map['description'] ?? "Hello is description",
    );
  }
}