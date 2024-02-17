import 'package:chat_app/presentation/bloc/openchannel_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Open Channels", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<OpenchannelBloc, OpenchannelState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 25),
                    Text(
                      "Loading",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Container(
                      child: ListTile(
                          leading: state is ChannelsList
                              ? Image.network(
                                  state.mainChannel.cover_url,
                                  width: 48,
                                  height: 48,
                                  fit: BoxFit.cover,
                                )
                              : SizedBox(),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          title: Text(state is ChannelsList
                              ? state.mainChannel.name
                              : ''),
                          onTap: () {
                            BlocProvider.of<OpenchannelBloc>(context).add(
                                GetChannelEvent(
                                    id: state is ChannelsList
                                        ? state.mainChannel.channel_url
                                        : '',
                                    channel_name: state is ChannelsList
                                        ? state.mainChannel.name
                                        : ''));
                            Navigator.pushNamed(context, '/chat');
                          })),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Other Channels",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          state is ChannelsList ? state.channels.length : 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                            leading: state is ChannelsList
                                ? Image.network(
                                    state.channels[index].cover_url,
                                    width: 48,
                                    height: 48,
                                    fit: BoxFit.cover,
                                  )
                                : SizedBox(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            title: Text(state is ChannelsList
                                ? state.channels[index].name
                                : ''),
                            onTap: () {
                              BlocProvider.of<OpenchannelBloc>(context).add(
                                  GetChannelEvent(
                                      id: state is ChannelsList
                                          ? state.channels[index].channel_url
                                          : '',
                                      // channel_url
                                      // "sendbird_open_channel_14092_bf4075fbb8f12dc0df3ccc5c653f027186ac9211",
                                      channel_name: state is ChannelsList
                                          ? state.channels[index].name
                                          : ''));
                              Navigator.pushNamed(context, '/chat');
                            });
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
