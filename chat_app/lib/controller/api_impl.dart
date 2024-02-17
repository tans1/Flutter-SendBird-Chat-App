import 'dart:convert';

import 'package:chat_app/controller/api_interface.dart';
import 'package:chat_app/model/channel_message.dart';
import 'package:chat_app/model/channel_model.dart';
import 'package:http/http.dart' as http;

class ChatAPI implements ChatAPI_Interface {
  final http.Client client;

  ChatAPI({
    required this.client,
  });

  String application_id = "BC823AD1-FBEA-4F08-8F41-CF0D9D280FBF";
  // String channel_url =
  //     "sendbird_open_channel_14092_bf4075fbb8f12dc0df3ccc5c653f027186ac9211";

  @override
  Future<ChannelModel> getChannelInfo(String channel_url) async {
    final http.Response response = await client.get(
      Uri.parse(
          "https://api-$application_id.sendbird.com/v3/open_channels/$channel_url"),
      headers: {
        'Content-Type': 'application/json',
        'Api-Token': 'f93b05ff359245af400aa805bafd2a091a173064'
      },
    );
    return await ChannelModel.fromJson(
      json.decode(response.body),
    );
  }

  @override
  Future<List<ChannelMessageModel>> getChannelMessages(
      String channel_url) async {
    final http.Response response = await client.get(
      Uri.parse(
          "https://api-$application_id.sendbird.com/v3/open_channels/$channel_url/messages?message_ts=1484208876543456789087654"),
      headers: {
        'Content-Type': 'application/json',
        'Api-Token': 'f93b05ff359245af400aa805bafd2a091a173064'
      },
    );
    final List<dynamic> messageList = jsonDecode(response.body)['messages'];
    return messageList
        .map((json) => ChannelMessageModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<ChannelModel>> getAllChannels() async {
    final http.Response response = await client.get(
      Uri.parse("https://api-$application_id.sendbird.com/v3/open_channels"),
      headers: {
        'Content-Type': 'application/json',
        'Api-Token': 'f93b05ff359245af400aa805bafd2a091a173064'
      },
    );
    final List<dynamic> channels = jsonDecode(response.body)['channels'];
    return channels.map((json) => ChannelModel.fromJson(json)).toList();
  }

  @override
  Future<void> sendMessage(String channel_url , String message) async {
    final http.Response response = await client.post(
      Uri.parse(
          "https://api-$application_id.sendbird.com/v3/open_channels/$channel_url/messages"),
      headers: {
        'Content-Type': 'application/json',
        'Api-Token': 'f93b05ff359245af400aa805bafd2a091a173064'
      },
      body: jsonEncode(
        {
          "message_type": "MESG",
          "user_id": "dev",
          "message": message,
        },
      ),
    );
  }
}
