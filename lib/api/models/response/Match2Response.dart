class Match2Response {
  final Match2Data data;
  final String message;
  final bool success;

  Match2Response({
    required this.data,
    required this.message,
    required this.success,
  });

  factory Match2Response.fromJson(Map<String, dynamic> json) {
    return Match2Response(
      data: Match2Data.fromJson(json["data"]),
      message: json['message'],
      success: json['success'],
    );
  }
}

class Match2Data {
  final int matchTotal;
  final List<String> allDates;

  Match2Data({
    required this.matchTotal,
    required this.allDates,
  });

  factory Match2Data.fromJson(Map<String, dynamic> json) {
    return Match2Data(
      matchTotal: json['matchTotal'],
      allDates: List<String>.from(json["allDates"]),
    );
  }
}
