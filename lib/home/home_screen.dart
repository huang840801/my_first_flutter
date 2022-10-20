import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../util/SharedPrefences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.orange,
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(
          image: AssetImage("images/login_background.png"),
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Center(
          child: FutureBuilder<String>(
            future: getLoginKey(),
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                return Text(snapshot.data!,
                style: TextStyle(fontSize: 20),);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}",
                style: TextStyle(fontSize: 20),);
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
