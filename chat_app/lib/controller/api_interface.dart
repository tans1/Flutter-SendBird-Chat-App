import 'package:chat_app/model/channel_message.dart';
import 'package:chat_app/model/channel_model.dart';

abstract class ChatAPI_Interface {
  Future<List<ChannelModel>> getAllChannels();
  Future<ChannelModel> getChannelInfo(String channel_url);
  Future<List<ChannelMessageModel>> getChannelMessages(String channel_url);
  Future<void> sendMessage(String channel_url, String message);
}
