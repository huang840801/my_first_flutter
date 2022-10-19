class GithubUserResponse {
  final int id;
  final String login;
  final String avatarUrl;

  GithubUserResponse({required this.id, required this.login, required this.avatarUrl});

  factory GithubUserResponse.fromJson(Map<String, dynamic> json) {
    return GithubUserResponse(
      id: json['id'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
    );
  }
}