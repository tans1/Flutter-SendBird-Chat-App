import 'package:bloc/bloc.dart';
import 'package:chat_app/presentation/barrel.dart';
import 'package:equatable/equatable.dart';

part 'openchannel_event.dart';
part 'openchannel_state.dart';

class OpenchannelBloc extends Bloc<OpenchannelEvent, OpenchannelState> {
  final ChatAPI_Interface chatAPI;

  OpenchannelBloc({
    required this.chatAPI,
  }) : super(OpenchannelInitial()) {
    on<GetChannelEvent>(_onPassOpenchannelIdEvent);
    on<GetAllChannels>(_onGetAllChannels);
    on<SendMessage>(_onSendMessage);
  }

  Future<void> _onPassOpenchannelIdEvent(
    GetChannelEvent event,
    Emitter<OpenchannelState> emit,
  ) async {
    emit(Loading());
    final channelMessage = await chatAPI.getChannelMessages(event.id);
    emit(OpenchannelMessage(
        messages: channelMessage,
        channel_url: event.id,
        channel_name: event.channel_name));
  }

  Future<void> _onGetAllChannels(
    GetAllChannels event,
    Emitter<OpenchannelState> emit,
  ) async {
    emit(Loading());
    final channels = await chatAPI.getAllChannels();
    final mainChannel = await chatAPI.getChannelInfo(
        "sendbird_open_channel_14092_bf4075fbb8f12dc0df3ccc5c653f027186ac9211");
    emit(ChannelsList(channels: channels, mainChannel: mainChannel));
  }

  Future<void> _onSendMessage(
    SendMessage event,
    Emitter<OpenchannelState> emit,
  ) async {
    await chatAPI.sendMessage(event.id, event.message);
    final channelMessage = await chatAPI.getChannelMessages(event.id);
    emit(OpenchannelMessage(
        messages: channelMessage,
        channel_url: event.id,
        channel_name: event.channel_name));
  }
}
