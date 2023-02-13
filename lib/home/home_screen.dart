import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:my_first_flutter/api/api_service.dart';
import 'package:my_first_flutter/api/models/response/Match2Response.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../MarqueeWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String routeName = "/home_screen";

  static Route getRoute() {
    Route route = MaterialPageRoute(builder: (context) => MainApp());
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

class MainApp extends StatelessWidget {
  var androidVersionNames = ["Cupcake", "Donut", "Eclair", "Froyo", "Gingerbread", "Honeycomb", "Ice Cream Sandwich", "Jellybean", "Kitkat", "Lollipop", "Marshmallow", "Nougat", "Oreo", "Pie"];
  var slideTransitionHome = SlideTransitionHome();

  @override
  Widget build(BuildContext context) {
    slideTransitionHome.setText("123456789");

    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Flutter"),
      ),
      body:
      // slideTransitionHome
      // slideTransitionHome.setText("Hello 123")

      WebView(
        initialUrl: "https://www.google.com.tw",
      ),
      // body: ListView.builder(
      //   itemBuilder: (context, position) {
      //     switch (position % 3) {
      //       case 0:
      //         {
      //           return Image.network("https://titangene.github.io/images/cover/flutter.jpg");
      //         }
      //         break;
      //       default:
      //         {
      //           return Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 16.0, top: 20.0, right: 16.0, bottom: 20.0),
      //                 child: Text(
      //                   androidVersionNames[position],
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.bold,
      //                     fontSize: 16.0,
      //                   ),
      //                 ),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      //                 child: Divider(
      //                   height: 1.0,
      //                   color: Colors.grey,
      //                 ),
      //               )
      //             ],
      //           );
      //         }
      //     }
      //   },
      //   itemCount: androidVersionNames.length,
      // ),
    );
  }
}
