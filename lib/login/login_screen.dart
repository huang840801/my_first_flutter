import 'package:flutter/material.dart';
import 'package:my_first_flutter/routes.dart';

import '../custom/my_elevated_button.dart';
import 'login_view_model.dart';

var grey = const Color.fromARGB(255, 135, 142, 151);
var white = const Color.fromARGB(255, 255, 255, 255);
var underlineInputBorder = UnderlineInputBorder(
  borderSide: BorderSide(color: grey),
);

TextEditingController accountController = TextEditingController();
TextEditingController passwordController = TextEditingController();
LoginViewModel viewModel = LoginViewModel();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String routeName = "/login_screen";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ThemeData().colorScheme.copyWith(primary: grey),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginWidget(),
      routes: routes,
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
            padding: const EdgeInsets.only(left: 28, top: 0, right: 28, bottom: 0),
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 50),
                  alignment: Alignment.center,
                  child: const Image(
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
                      onPressed: () {
                        viewModel.login(accountController.text, passwordController.text);
                        // Navigator.pushNamed(context, HomeScreen.routeName);
                      },
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
    controller: accountController,
    style: TextStyle(color: white),
    decoration: InputDecoration(
        enabledBorder: underlineInputBorder,
        focusedBorder: underlineInputBorder,
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
        icon: Icon(Icons.person, color: grey),
        labelText: "请输入账号",
        labelStyle: TextStyle(color: grey, fontSize: 16)),
  );
}

TextFormField buildPasswordFormField() {
  return TextFormField(
    controller: passwordController,
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
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      icon: Icon(Icons.lock, color: grey),
      labelText: "请输入登录密码",
      labelStyle: TextStyle(color: grey, fontSize: 16),
    ),
  );
}
