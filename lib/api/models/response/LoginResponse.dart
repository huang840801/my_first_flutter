class LoginResponse {
  final LoginData data;
  final String message;
  final bool success;

  LoginResponse({
    required this.data,
    required this.message,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      data: LoginData.fromJson(json["data"]),
      message: json['message'],
      success: json['success'],
    );
  }
}

class LoginData {
  final String key;
  final String userName;
  final int userID;

  LoginData({
    required this.key,
    required this.userName,
    required this.userID,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      key: json['key'],
      userName: json['userName'],
      userID: json['userID'],
    );
  }
}
