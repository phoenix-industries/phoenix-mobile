import 'package:phoenix/Utils/class/UserClass.dart';

class ItemBuyclass {
  String id;
  List<String> images;
  String itemName;
  String price;
  String category;
  String time;
  String Condation;
  String location;
  String description;
  UserClass User;

  ItemBuyclass({
    required this.id,
    required this.images,
    required this.itemName,
    required this.price,
    required this.time,
    required this.Condation,
    required this.category,
    required this.location,
    required this.description,
    required this.User,
  });

  factory ItemBuyclass.fromJson(Map<String, dynamic> json) {
    return ItemBuyclass(
      id: json['id'].toString(),
      images: List<String>.from(json['images'] ?? []),
      itemName: json['title'] ?? 'no name',
      price: json['price'].toString(),
      category: json['category'] ?? 'no category',
      Condation: json['condation'] ?? 'no',
      time: json['time'] ?? 'no',
      location: json['location'] ?? 'no',
      description: json['description'] ?? 'no',
      User: UserClass(
        Id: 1,
        name: "Phoenix User",
        email: "phoenix@test.com",
        phone: "01000000000",
        age: 25,
        image: null,
        Bio:
            "Demo user hdhduuhefjkelfawkdjwfejhfurhgtowiefiwjsdcbshegrewiufhawbdhsgeiuruehrfhawdbchygeriwe",
        governorate: "Cairo",
        city: 'maadi'
      ),
    );
  }
}
