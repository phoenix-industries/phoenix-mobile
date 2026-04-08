import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Soursestorageservics {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  Future<void> savetoken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String?> gettoken() async {
    return await storage.read(key: 'token');
  }

  Future<void> deletetoken() async {
    await storage.delete(key: 'token');
  }
}
