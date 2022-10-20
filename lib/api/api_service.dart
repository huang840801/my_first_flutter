import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first_flutter/api/models/response/LoginResponse.dart';
import 'package:my_first_flutter/util/StringUtil.dart';

import '../util/SharedPrefences.dart';
import 'models/response/GithubUserResponse.dart';
import 'models/response/Match2Response.dart';

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

Future<Match2Response> getMatchList() async {
  final loginKey = await getLoginKey();
  final userName = await getUserName();
  final userId = await getUserId();
  final response = await http.post("http://192.168.104.30:7788/Obsp/Matchs2",
      headers: <String, String>{
        "Content-Type": "application/json",
        "X-Hec-Authentication": loginKey,
        "UserID": userId.toString(),
        "UserName": userName,
      },
      body: jsonEncode(<String, dynamic>{
        "matchStatus": 2,
        "sortType": 0,
        "sportId": "1",
        "tournamentIds": [],
      }));

  if (response.statusCode == 200) {
    print("Huang 200=${response.body}");

    return Match2Response.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to getMatchList");
  }
}
