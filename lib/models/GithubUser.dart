
class GithubUser {
  final int id;
  final String login;
  final String avatarUrl;

  GithubUser({required this.id, required this.login, required this.avatarUrl});

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return GithubUser(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}