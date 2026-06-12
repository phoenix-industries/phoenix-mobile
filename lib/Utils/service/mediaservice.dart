import 'dart:io';
import 'package:dio/dio.dart';
import 'package:phoenix/Utils/class/uploadmediaclass.dart';
import 'package:phoenix/Utils/service/ApiClient.dart';

class mediaservice {
  Future<uploadmediaclass?> uploadImage(File? file) async {
    try {
      if (file != null) {
        String fileName = file.path.split('/').last;

        FormData formData = FormData.fromMap({
          "file": await MultipartFile.fromFile(file.path, filename: fileName),
        });

        final response = await Apiclient.dio.post(
          "/files/v1/upload",
          data: formData,
          options: Options(headers: {"Content-Type": "multipart/form-data"}),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return uploadmediaclass.fromJson(response.data);
        } else {
          print("Upload failed: ${response.data}");
          return null;
        }
      }
    } catch (e) {
      print("Upload error: $e");
      return null;
    }
  }

  Future<String?> downloadImage(String? imageId) async {
    try {
      final response = await Apiclient.dio.get("/files/v1/download/$imageId");
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print("Download error: $e");
      return null;
    }
  }
}
