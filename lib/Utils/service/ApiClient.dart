import 'package:dio/dio.dart';
import 'package:phoenix/Utils/service/sourseStorageservics.dart';

class Apiclient {
  static final Soursestorageservics storage = Soursestorageservics();

  static final Dio dio = Dio(BaseOptions(baseUrl: 'https://dummyjson.com'))
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await storage.gettoken();

          if (token != null && token.isNotEmpty) {
            options.headers["Authorization"] = "Bearer $token";
          }

          return handler.next(options);
        },
      ),
    );
}
