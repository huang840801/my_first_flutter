import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first_flutter/api/models/response/LoginResponse.dart';
import 'package:my_first_flutter/util/StringUtil.dart';

import 'models/response/GithubUserResponse.dart';

Future<GithubUserResponse> fetchGithubUser(String user) async {
  final response = await http.get('https://api.github.com/users/$user');

  if (response.statusCode == 200) {
    return GithubUserResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load GithubUser');
  }
}

Future<LoginResponse> logon(String account, String password) async {
  final encryptPassword = encrypt(password);
  final response = await http.post(
      "http://192.168.104.30:7788/Account/LogOnV1/",
      headers: <String, String>{
        "Content-Type": "application/json",
      },
      body: jsonEncode(<String, String>{
        "UserName": account,
        "password": encryptPassword,
      }));

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to logon");
  }
}
