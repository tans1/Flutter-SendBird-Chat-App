class ChannelModel {
  final String name;
  final String channel_url;
  final String data;
  final String cover_url;

  ChannelModel(
      {required this.cover_url,
      required this.name,
      required this.channel_url,
      required this.data});

  factory ChannelModel.fromJson(Map<String, dynamic> json) {
    return ChannelModel(
      name: json['name'],
      channel_url: json['channel_url'],
      data: json['data'],
      cover_url: json['cover_url'],
    );
  }
}
