import 'package:phoenix/Utils/class/UserClass.dart';

class Authclass {
  final bool success;
  final String message;
  final String? token;

  Authclass({required this.message, required this.success, this.token});

  factory Authclass.fromJson(Map<String, dynamic> json) {
    final String? accessToken = json['token'];
    final userJson = json['user'];

    final bool isLoginSuccessful =
        accessToken != null && accessToken.isNotEmpty;

    return Authclass(
      success: isLoginSuccessful,

      message: isLoginSuccessful ? "Success" : "Login Failed",
      token: accessToken ?? '',
    );
  }
}
