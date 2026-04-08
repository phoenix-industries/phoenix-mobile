class ItemBuyclass {
  String id;
  List<String> images;
  String itemName;
  String personName;
  String price;
  String category;
  String time;
  String Condation;
  String location;
  String description;

  ItemBuyclass({
    required this.id,
    required this.images,
    required this.itemName,
    required this.personName,
    required this.price,
    required this.time,
    required this.Condation,
    required this.category,
    required this.location,
    required this.description,
  });

  factory ItemBuyclass.fromJson(Map<String, dynamic> json) {
    return ItemBuyclass(
      id: json['id'].toString(),
      images: List<String>.from(json['images'] ?? []),
      itemName: json['title'] ?? 'no name',
      personName: json['brand'] ?? 'unknown',
      price: json['price'].toString(),
      category: json['category'] ?? 'no category',
      Condation: json['condation'] ?? 'no',
      time: json['time'] ?? 'no',
      location: json['location'] ?? 'no',
      description: json['description'] ?? 'no',
    );
  }
}
