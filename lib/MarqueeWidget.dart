import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideTransitionHome extends StatefulWidget {

  String text = "";
  _SlideTransitionHomeState _slideTransitionHomeState = _SlideTransitionHomeState();

  @override
  _SlideTransitionHomeState createState() {
    _slideTransitionHomeState.setText(text);
    return _slideTransitionHomeState;
  }

  setText(String text) {
    this.text = text;
  }
}

class _SlideTransitionHomeState extends State<SlideTransitionHome> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  Tween<Offset> controllerTween = Tween<Offset>(begin: Offset(6, 0.0), end: Offset(0,0));
  String text = "";
  GlobalKey _key = GlobalKey();
  Size _size = Size.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Size calcTextSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    var textWidget = Text(
         text,
      key: _key,
    );



    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SlideTransition(
                  position: _controller.drive(controllerTween),
                  child: textWidget
              ),
            ),
            Text("width=${MediaQuery.of(context).size.width}"),
            Text("height=${MediaQuery.of(context).size.height}")
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // print("Huang size=${_key.currentContext?.size}");
          // print("Huang screen width=${MediaQuery.of(context).size.width}");
          // print("Huang screen height=${MediaQuery.of(context).size.height}");
          setState(() {
            setState(() => _size = _key.currentContext!.size!);
          });
          _controller.isDismissed ? _controller.forward() : _controller.reverse();
        },
      ),
    );
  }

  void setText(String text) {
    this.text = text;
  }
}