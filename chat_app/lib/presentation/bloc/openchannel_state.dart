part of 'openchannel_bloc.dart';

abstract class OpenchannelState extends Equatable {
  const OpenchannelState();

  @override
  List<Object> get props => [];
}

class OpenchannelInitial extends OpenchannelState {}

class Loading extends OpenchannelState {}

class ChannelsList extends OpenchannelState {
  final List<ChannelModel> channels;
  final ChannelModel mainChannel;
  ChannelsList({
    required this.channels,
    required this.mainChannel,
  });
  @override
  List<Object> get props => [this.channels, this.mainChannel];
}

class SaveOpenchannel extends OpenchannelState {
  final ChannelModel channel;
  SaveOpenchannel({
    required this.channel,
  });
  @override
  List<Object> get props => [this.channel];
}

class OpenchannelMessage extends OpenchannelState {
  final String channel_name;
  final String channel_url;
  final List<ChannelMessageModel> messages;
  OpenchannelMessage({
    required this.messages,
    required this.channel_name,
    required this.channel_url,
  });
  @override
  List<Object> get props => [
        this.messages,
        this.channel_name,
        this.channel_url,
      ];
}
