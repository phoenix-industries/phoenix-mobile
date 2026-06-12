class Authclass {
  final bool success;
  final String message;
  final String? accessToken;
  final String? refreshtoken;

  Authclass({
    required this.message,
    required this.success,
    this.accessToken,
    this.refreshtoken,
  });

  factory Authclass.fromJson(Map<String, dynamic> json) {
    final bool ok = json['ok'] ?? false;

    final String? accessToken = json['data']?['access_token'];
    final String? refreshtoken = json['data']?['refresh_token'];

    return Authclass(
      success: ok,
      message: ok ? "Success" : "Login Failed",
      accessToken: accessToken,
      refreshtoken: refreshtoken,
    );
  }
}
