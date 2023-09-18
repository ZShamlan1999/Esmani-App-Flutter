import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert'; //عشان نحول من جيسون لدارت
import 'package:path/path.dart';

class Crud {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        //اذا صار الاتصال بمعنى الصفحه موجوده
        var responsebody = jsonDecode(
            response.body); //نستقبل محتوى الريسبونس بيكون جيسون ونحوله لدارت
        return responsebody;
      } else {
        print("Erorr ${response.statusCode}");
      }
    } catch (e) {
      print("Error ${e}");
    }
  }

  postRequest(String url, Map data) async {
    await Future.delayed(Duration(milliseconds: 500));
    try {
      var response = await http.post(Uri.parse(url),
          body: data); //الداتا هي الحقول مثل يوزر وايميل والباس
      if (response.statusCode == 200) {
        //اذا صار الاتصال بمعنى الصفحه موجوده
        Map<String, dynamic> responsebody = jsonDecode(
            response.body); //نستقبل محتوى الريسبونس بيكون جيسون ونحوله لدارت
        return responsebody;
      } else {
        print("Erorr ${response.statusCode}");
      }
    } catch (e) {
      print("Error ${e}");
    }
  }

  postRequestWithFile(String url, Map data, File file) async {
    await Future.delayed(Duration(seconds: 2));
    var request = await http.MultipartRequest("POST", Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);

    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Erorr ${response.statusCode}");
    }
  }
}
