import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../Constans.dart';


class FileService {
  static String url = Constants.BASE_URL + "/api/files";

  static Future<File> uploadFile(File file) async {
    try {
      Map<String, String> header = {
        "Authorization": "Bearer " + Constants.BEARER_TOKEN,
        'Content-Type': 'multipart/form-data; charset=UTF-8',
      };

      var request = http.MultipartRequest(
          'POST', Uri.parse(url + "/uploadFile"));
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
      request.headers.addAll(header);
      var response = await request.send().then((result) => {
      http.Response.fromStream(result).then((res) {
      if (res.statusCode == 200) {
            print(res);
            Map<String, dynamic> resData = jsonDecode(res.body);
            Constants.IMAGE_ID=resData["id"];
            print(resData["id"].toString());
          return null;
          } else {
          print("Hata Oluştu!");
          return null;
          }
      })
    });

    } catch (e) {
    print("Hata Oluştu!\n" + e.toString());
    return null;
    }
  }
}
