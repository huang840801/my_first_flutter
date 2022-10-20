import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_service.dart';
import '../util/SharedPrefences.dart';

class LoginViewModel {

  Future<bool> login(String account, String password) async {
    return await logon(account, password).then((value) async {
      final sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString(LOGIN_KEY, value.data.key);
      sharedPreferences.setString(USER_NAME, value.data.userName);
      sharedPreferences.setInt(USER_ID, value.data.userID);
      return value.success;
    }).catchError((error) {
      return false;
    });
  }
}
