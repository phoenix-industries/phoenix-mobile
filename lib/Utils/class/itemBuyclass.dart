class ItemBuyclass {
  String id;
  String itemName;
  int price;
  String categoryId;
  String categoryName;
  DateTime time;
  String condition;
  bool donated;
  String description;
  String userId;
  String userName;
  String userCity;
  String userGovernorate;
  String userAddress;
  String? brand;
  String? imageId;

  ItemBuyclass({
    required this.id,
    required this.itemName,
    required this.price,
    required this.categoryId,
    required this.categoryName,
    required this.time,
    required this.condition,
    required this.donated,
    required this.description,
    required this.userId,
    required this.userName,
    required this.userCity,
    required this.userGovernorate,
    required this.userAddress,
    this.brand,
    this.imageId,
  });

  factory ItemBuyclass.fromJson(Map<String, dynamic> json) {
    final category = json['category'] ?? {};
    final user = json['user'] ?? {};

    return ItemBuyclass(
      id: json['id'] ?? '',
      itemName: json['name'] ?? '',
      price: (json['price'] ?? 0) is int
          ? json['price']
          : int.tryParse(json['price'].toString()) ?? 0,
      categoryId: category['id'] ?? '',
      categoryName: category['name'] ?? '',
      time: DateTime.parse(json['created_at']),
      condition: json['condition'] ?? '',
      donated: json['donated'] ?? false,
      description: json['description'] ?? '',
      userId: user['id'] ?? '',
      userName: user['name'] ?? '',
      userCity: user['city'] ?? '',
      userGovernorate: user['governorate'] ?? '',
      userAddress: user['address'] ?? '',
      brand: json['brand'],
      imageId: json['image_id'],
    );
  }
}
