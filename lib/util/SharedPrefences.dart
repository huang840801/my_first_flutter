
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getLoginKey() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString(LOGIN_KEY) == null ? "" : sharedPreferences.getString(LOGIN_KEY)!;
}

Future<String> getUserName() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString(USER_NAME) == null ? "" : sharedPreferences.getString(USER_NAME)!;
}

Future<int> getUserId() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getInt(USER_ID) == null ? -999 : sharedPreferences.getInt(USER_ID)!;
}

const LOGIN_KEY = "SHARED_PREFERENCES_LOGIN_KEY";
const USER_NAME = "SHARED_PREFERENCES_USER_NAME";
const USER_ID = "SHARED_PREFERENCES_USER_ID";