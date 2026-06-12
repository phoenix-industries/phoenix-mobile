import 'package:dio/dio.dart';
import 'package:phoenix/Utils/service/sourseStorageservics.dart';

class Apiclient {
  static final Soursestorageservics storage = Soursestorageservics();

  static final Dio dio =
      Dio(BaseOptions(baseUrl: 'https://osama.alwaysdata.net'))
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              final token = await storage.getAccessToken();

              if (token != null && token.isNotEmpty) {
                options.headers["Authorization"] = "Bearer $token";
              }

              return handler.next(options);
            },

            onError: (error, handler) async {
              if (error.response?.statusCode == 401) {
                try {
                  final refreshToken = await storage.getRefreshToken();

                  final response = await dio.post(
                    '/auth/refresh',
                    data: {"refresh_token": refreshToken},
                  );

                  final newAccessToken = response.data['data']['access_token'];

                  await storage.saveAccessToken(newAccessToken);

                  final requestOptions = error.requestOptions;

                  requestOptions.headers["Authorization"] =
                      "Bearer $newAccessToken";

                  final retryResponse = await dio.fetch(requestOptions);

                  return handler.resolve(retryResponse);
                } catch (e) {
                  await storage.deleteTokens();
                }
              }

              return handler.next(error);
            },
          ),
        );
}
