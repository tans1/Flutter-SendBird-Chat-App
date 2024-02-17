class User {
  final String user_id;
  final String profile_url;
  final String nickname;
  final String role;
  final bool is_active;

  User(
      {required this.user_id,
      required this.profile_url,
      required this.nickname,
      required this.role,
      required this.is_active});
}

class ChannelMessageModel {
  final String type;
  final int message_id;
  final int created_at;
  final String data;
  final String message;
  final User user;

  ChannelMessageModel(
      {required this.type,
      required this.message_id,
      required this.data,
      required this.message,
      required this.created_at,
      required this.user});

  factory ChannelMessageModel.fromJson(Map<String, dynamic> json) {
    return ChannelMessageModel(
      type: json['type'],
      message_id: json['message_id'],
      data: json['data'],
      message: json['message'],
      created_at: json['created_at'],
      user: json.containsKey('user')
          ? User(
              user_id: json['user']['user_id'] ?? "",
              profile_url: json['user']['profile_url'] ?? "",
              nickname: json['user']['nickname'] ?? "",
              role: json['user']['role'] ?? "",
              is_active: json['user']['is_active'] ?? false,
            )
          : User(
              user_id: "",
              profile_url: "",
              nickname: "",
              role: "",
              is_active: false,
            ),
    );
  }
}
