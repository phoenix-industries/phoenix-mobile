class uploadmediaclass {
  final String id;

  uploadmediaclass({required this.id});

  factory uploadmediaclass.fromJson(Map<String, dynamic> json) {
    return uploadmediaclass(id: json['data']['id']);
  }
}
