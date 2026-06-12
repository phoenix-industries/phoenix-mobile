class Itemsellclass {
  String? image_id;
  String name;
  String description;
  bool donated;
  String category_id;
  String Condation;
  int? Price;
  String? Brand;

  Itemsellclass({
    this.image_id,
    required this.name,
    required this.donated,
    required this.description,
    required this.category_id,
    required this.Condation,
    this.Brand,
    this.Price,
  });

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "category_id": category_id,
    "condition": Condation,
    "donated": donated,
    "brand": Brand,
    "image_id": image_id,
    "price": Price ?? 0,
    "minimum_age": 18,
    "maximum_age": 99,
    "target_gender": "male",
  };
}
