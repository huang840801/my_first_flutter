
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getLoginKey() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("LOGIN_KEY") == null ? "" : sharedPreferences.getString("LOGIN_KEY")!;
}
