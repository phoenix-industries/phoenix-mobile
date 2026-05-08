class UserClass {
  int Id;
  String name;
  String phone;
  String email;
  String? image;
  int age;
  String? Bio;
  String? governorate;
  String? city;

  UserClass({
    required this.Id,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    required this.age,
    this.Bio,
    this.governorate,
    this.city
   
  });
  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      Id: json['id']??0,
      name: json['name'] ?? 'unknown',
      email: json['email'] ?? 'phoenix@gmail.com',
      phone: json['phone'] ?? '01...........',
      image: json['image'],
      Bio: json['Bio'] ?? 'Possionate about sustainable trading.',
      governorate: json['governorate'] ?? 'cairo',
      city: json['city']??'maadi',
      age: json['age']?? 25,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': Id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'Bio': Bio,
      'governorate': governorate,
      'city': city,
      'age': age,
    };
  }
}
