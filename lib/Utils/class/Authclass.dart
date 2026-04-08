class Authclass {
  final bool success;
  final String message;
  final String? token;

  Authclass({required this.message, required this.success, this.token});
  factory Authclass.fromJson(Map<String, dynamic> json) {
    // 1. هنا بنجيب قيمة التوكن ونحولها لمتغير نصي
    final String? accessToken = json['accessToken'];

    // 2. هنا بنحدد القيمة المنطقية (Boolean) بناءً على وجود التوكن
    // المتغير ده هو اللي هندي له القيمة true أو false
    final bool isLoginSuccessful =
        accessToken != null && accessToken.isNotEmpty;

    return Authclass(
      // 3. بنستخدم المتغير المنطقي هنا
      success: isLoginSuccessful,

      // بنخلي الرسالة تعتمد على حالة النجاح
      message: isLoginSuccessful ? "Success" : "Login Failed",
      token: accessToken ?? '',
    );
  }
}
