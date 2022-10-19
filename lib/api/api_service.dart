import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first_flutter/api/models/response/LoginResponse.dart';

import 'models/response/GithubUserResponse.dart';

Future<GithubUserResponse> fetchGithubUser(String user) async {
  final response = await http.get('https://api.github.com/users/$user');

  if (response.statusCode == 200) {
    return GithubUserResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load GithubUser');
  }
}

Future<LoginResponse> fetchLogin(String account, String password) async {
  final response = await http.post(
      "http://192.168.104.30:7788/Account/LogOnV1/",
      headers: <String, String>{
        "Content-Type": "application/json",
      },
      body: jsonEncode(<String, String>{"UserName": "Jackson", "password": "6c9748a341ae99"}));

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load GithubUser");
  }
}
