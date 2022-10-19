import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/GithubUser.dart';


Future<GithubUser> fetchGithubUser(String user) async {
  final response =
  await http.get('https://api.github.com/users/$user');


  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("Huang success");
    return GithubUser.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print("Huang error");
    throw Exception('Failed to load GithubUser');
  }
}

class GithubUserWidget extends StatefulWidget {
  // const GithubUser({Key key}) : super(key: key);

  @override
  _GithubUserState createState() => _GithubUserState();
}

class _GithubUserState extends State<GithubUserWidget> {
  late Future<GithubUser> futureGithubUser;

  @override
  void initState() {
    super.initState();
    futureGithubUser = fetchGithubUser("huang840801");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Fetch Data Example'),
          ),
          body:Column(
            children: [
              Center(
                child: FutureBuilder<GithubUser>(
                  future: futureGithubUser,
                  builder: (context, snapshot) {

                    if (snapshot.hasData) {
                      return Text(snapshot.data!.login);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              Center(
                child: FutureBuilder<GithubUser>(
                  future: futureGithubUser,
                  builder: (context, snapshot) {

                    if (snapshot.hasData) {

                      return Image.network(snapshot.data!.avatarUrl);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
              ),

              Image.network("https://titangene.github.io/images/cover/flutter.jpg")
            ],
          )
      ),
    );
  }
}