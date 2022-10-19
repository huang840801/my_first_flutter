import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MyElevatedButton.dart';

var grey = const Color.fromARGB(255, 135, 142, 151);
var white = const Color.fromARGB(255, 255, 255, 255);
var underlineInputBorder = UnderlineInputBorder(
  borderSide: BorderSide(color: grey),
);

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(primary: grey),
      ),
      debugShowCheckedModeBanner: false,
      title: "Test",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage("images/login_background.png"),
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          Container(
            padding: EdgeInsets.only(left: 28, top: 50, right: 28, bottom: 0),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 0),
                  alignment: Alignment.center,
                  child:   Image(
                    image: AssetImage("images/logo_amd_splash.png"),
                    height: 38,
                    width: 120,
                  ),
                ),
                buildAccountFormField(),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: buildPasswordFormField(),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30),
                  child: MyElevatedButton(
                      height: 56,
                      gradient: const LinearGradient(
                        colors: [Color.fromARGB(255, 19, 162, 186), Color.fromARGB(255, 8, 124, 149)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      onPressed: () {},
                      child: Text(
                        "登录",
                        style: TextStyle(fontSize: 18, color: white),
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "忘记密码",
                        style: TextStyle(fontSize: 14, color: grey),
                      ),
                      Text(
                        "联系客服",
                        style: TextStyle(fontSize: 14, color: grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TextFormField buildAccountFormField() {
  return TextFormField(
    // focusNode: focusNode,
    style: TextStyle(color: white),
    decoration: InputDecoration(
        enabledBorder: underlineInputBorder,
        focusedBorder: underlineInputBorder,
        contentPadding: EdgeInsets.symmetric(vertical: 0),
        icon: Icon(Icons.person, color: grey),
        labelText: "请输入账号",
        labelStyle: TextStyle(color: grey, fontSize: 16)),
  );
}

TextFormField buildPasswordFormField() {
  return TextFormField(
    style: TextStyle(color: white),
    obscureText: true,
    cursorColor: white,
    // onSaved: (newValue) => password = newValue,
    onChanged: (value) {
      //若更新後的密碼，已解決錯誤，即清掉該錯誤訊息，送出時還會檢查最後密碼是否符合我們的條件
    },
    validator: (value) {
      return null;
    },
    decoration: InputDecoration(
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      icon: Icon(Icons.lock, color: grey),
      labelText: "请输入登录密码",
      labelStyle: TextStyle(color: grey, fontSize: 16),
    ),
  );
}
