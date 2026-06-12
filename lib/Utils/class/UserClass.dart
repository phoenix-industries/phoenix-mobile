class UserClass {
  String Id;
  String name;
  String phone;
  String email;
  String? image;
  String? governorate;
  String? city;
  String? address;

  UserClass({
    required this.Id,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.governorate,
    this.city,
    this.address,
  });
  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      Id: json['id'] ?? '0',
      name: json['name'] ?? 'unknown',
      email: json['email'] ?? 'phoenix@gmail.com',
      phone: json['phone'] ?? '01...........',
      image: json['image'] ?? '',
      governorate: json['governorate'] ?? 'unknown',
      city: json['city'] ?? 'unknown',
      address: json['address'] ?? 'unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': Id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'governorate': governorate,
      'city': city,
    };
  }
}
