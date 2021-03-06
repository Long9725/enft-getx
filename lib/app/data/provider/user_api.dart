import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../controller/user.dart';

class UserApiClient {
  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  UserApiClient();

  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    final loginJson = {
      'address': data['address'],
      'privateKey': data['privateKey']
    };
    final uri =
        Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/auth/user/login");
    final body = json.encode(loginJson);

    final http.Response response =
        await http.post(uri, body: body, headers: headers);

    final responseBody = Map<String, dynamic>.from(json.decode(response.body));

    print("login api");
    print(responseBody);

    return responseBody;
  }

  Future<List<String>> getNFT(String address) async {
    final uri = Uri.parse(
        dotenv.env['SERVER_ADDRESS']! + ":3000/user/myNFT?address=${address}");

    Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json'
    };

    final http.Response response = await http.get(uri, headers: headers);

    final responseBody = List<String>.from(json.decode(response.body));

    print(response.body);
    return responseBody;
  }

  Future uploadProfile(File image) async {
    var dio = new Dio();
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;
      dio.options.headers = {'Content-Type': 'application/json'};

      String fileName = image.path.split('/').last;
      Map<String, dynamic> data = {
        'images': await MultipartFile.fromFile(image.path,
            filename: fileName,
            contentType: MediaType("image", fileName.split('.').last))
      };

      var formData = FormData.fromMap(data);

      var response = await dio.post(
        dotenv.env['SERVER_ADDRESS']! + ":3000/user/upload_profile",
        data: formData,
      );

      return response.data;
    } catch (e) {
      print(e);
    }
  }

  updateLocation(String location) async {
    try {
      final uri =
          Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/user/location");

      Map<String, String> headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${UserController.to.user.access_token}',
      };

      Map<String, String> data = <String, String>{'location': location};

      final body = json.encode(data);

      final http.Response response =
          await http.post(uri, headers: headers, body: body);

      final responseBody = json.decode(response.body);

      print(response.body);
      return responseBody;
    } catch (e) {
      print(e);
    }
  }
}
