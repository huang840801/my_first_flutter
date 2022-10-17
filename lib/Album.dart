
class Album {
  final int id;
  final String login;
  final String avatarUrl;

  Album({required this.id, required this.login, required this.avatarUrl});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}