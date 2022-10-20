import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_service.dart';

class LoginViewModel {

  Future<bool> login(String account, String password) async {
    return await logon(account, password).then((value) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("LOGIN_KEY", value.data.key);
      return value.success;
    }).catchError((error) {
      return false;
    });
  }
}
