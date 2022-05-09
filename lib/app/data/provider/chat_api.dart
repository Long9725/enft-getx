import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class ChatApiClient {
  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };

  ChatApiClient();

  Future<dynamic> getChatList(String nickname) async {
    final uri = Uri.parse(dotenv.env['SERVER_ADDRESS']! + ":3000/events/$nickname");

    final http.Response response = await http.get(uri, headers: headers);

    print(json.decode(response.body));
    final responseBody = json.decode(response.body);

    return responseBody;
  }
}