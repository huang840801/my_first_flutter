import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_first_flutter/api/models/response/GithubUserResponse.dart';

import '../api/api_service.dart';

class GithubUserWidget extends StatefulWidget {
  const GithubUserWidget({super.key});

  // const GithubUser({Key key}) : super(key: key);

  @override
  _GithubUserState createState() => _GithubUserState();
}

class _GithubUserState extends State<GithubUserWidget> {
  late Future<GithubUserResponse> futureGithubUser;

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
                child: FutureBuilder<GithubUserResponse>(
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
                child: FutureBuilder<GithubUserResponse>(
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