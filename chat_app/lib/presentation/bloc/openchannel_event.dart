part of 'openchannel_bloc.dart';

abstract class OpenchannelEvent extends Equatable {
  const OpenchannelEvent();

  @override
  List<Object> get props => [];
}

class GetChannelEvent extends OpenchannelEvent {
  final String id;
  final String channel_name;
  GetChannelEvent({
    required this.id,
    required this.channel_name,
  });

  @override
  List<Object> get props => [this.id, this.channel_name];
}

class GetAllChannels extends OpenchannelEvent {
  @override
  List<Object> get props => [];
}

class SendMessage extends OpenchannelEvent {
  final String message;
  final String id;
  final String channel_name;

  SendMessage(
      {required this.id, required this.channel_name, required this.message});
  @override
  List<Object> get props => [this.id, this.channel_name, this.message];
}
