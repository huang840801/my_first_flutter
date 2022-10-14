
class Album {
  final int id;
  final String login;

  Album({required this.id, required this.login});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      login: json['node_id'],
    );
  }
}