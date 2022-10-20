import '../api/api_service.dart';

class LoginViewModel {

  Future<bool> login(String account, String password) async {
    return await logon(account, password).then((value) {
      return value.success;
    }).catchError((error) {
      return false;
    });
  }
}
