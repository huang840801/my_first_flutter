import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/api/api_service.dart';
import 'package:my_first_flutter/api/models/response/Match2Response.dart';
import '../util/SharedPrefences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = "/home_screen";

  static Route getRoute() {
    Route route = MaterialPageRoute(builder: (context) => const HomeScreen());
    return route;
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.orange,
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  late Future<Match2Response> match2Response;

  @override
  void initState() {
    super.initState();
    match2Response = getMatchList();
  }

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
        // Center(
        //   child: FutureBuilder<Match2Response>(
        //     future: match2Response,
        //     builder: (context, snapshot) {
        //       // if (snapshot.data != null && snapshot.data!.isNotEmpty) {
        //       //   return Text(snapshot.data!,
        //       //   style: TextStyle(fontSize: 20),);
        //       // } else if (snapshot.hasError) {
        //       //   return Text("${snapshot.error}",
        //       //   style: TextStyle(fontSize: 20),);
        //       // }
        //       return const CircularProgressIndicator();
        //     },
        //   ),
        // ),
      ],
    );
  }
}
