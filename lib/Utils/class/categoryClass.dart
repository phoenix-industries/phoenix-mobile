class Categoryclass {
  final String id;
  final String name;
  Categoryclass({required this.id, required this.name});

  factory Categoryclass.fromJson(Map<String, dynamic> json) {
    return Categoryclass(id: json['id'] ?? '', name: json['name'] ?? '');
  }
}
