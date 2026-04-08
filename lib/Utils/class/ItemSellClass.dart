class Itemsellclass {
  List<String> images;
  String productTitle;
  String description;
  String? Brand;
  String Category;
  String Condation;
  String? Price;
  String Location;
  String type;
  DateTime uploadtime;

  Itemsellclass({
    required this.images,
    required this.productTitle,
    required this.description,
    required this.Category,
    required this.Condation,
    required this.Location,
    this.Brand,
    this.Price,
    required this.type,
    required this.uploadtime,
  });

  Map<String, dynamic> toJson() => {
    "title": productTitle,
    "description": description,
    "category": Category,
    "condition": Condation,
    "location": Location,
    "type": type,
    "images": images,
    "price": Price,
    'uploadTime': uploadtime.toIso8601String(),
  };

  factory Itemsellclass.fromJson(Map<String, dynamic> json) {
    return Itemsellclass(
      images: List<String>.from(json['image'] ?? []),
      productTitle: json['title'] ?? '',
      description: json['description'] ?? '',
      Category: json['category'] ?? '',
      Condation: json['condation'] ?? '',
      Location: json['location'],
      Price: json['price'].toString(),
      Brand: json['Brand'],
      type: json['type'] ?? '',
      uploadtime: DateTime.parse(json['uploadtime']),
    );
  }
}
