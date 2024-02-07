// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:job_finder_app/utils/constants.dart';
import 'package:job_finder_app/utils/shared_prefs.dart';

class ImageService {
  static Future<dynamic> uploadFile(filePath) async {
    try {
      FormData formData =
          FormData.fromMap({'image': await MultipartFile.fromFile(filePath)});

      Response response = await Dio().post('$baseUrl/user/profile/portofolios',
          data: formData,
          options: Options(headers: <String, String>{
            'Authorization': 'Bearer ${SharedPrefs().token}',
          }));
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }
}
