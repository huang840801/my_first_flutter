import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';

import '../api/api_service.dart';
import '../api/models/response/LoginResponse.dart';

class LoginViewModel {
  late Future<LoginResponse> futureLogin;

  Future<void> login(String account, String password) async {
    try {
      if (Platform.isAndroid) {
        DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
        var androidInfo = await deviceInfoPlugin.androidInfo;
        var release = androidInfo.version.release;
        var sdkInt = androidInfo.version.sdkInt;
        var manufacturer = androidInfo.manufacturer;
        var model = androidInfo.model;
        print("Huang Android $release (SDK $sdkInt), $manufacturer $model");

        futureLogin = fetchLogin(account, password);
        await futureLogin.then((value) {
          print("Huang message=${value.message}");
          print("Huang message=${value.success}");
          print("Huang lotteryType=${value.data.key}");
        }).catchError((error) {
          print("Huang error=$error");
        });
      }
    } catch (error) {}

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.name;
      var model = iosInfo.model;
      print("Huang $systemName $version, $name $model");
      // iOS 13.1, iPhone 11 Pro Max iPhone
    }
  }
}
