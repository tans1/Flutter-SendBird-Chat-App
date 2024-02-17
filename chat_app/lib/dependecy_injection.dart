import 'package:chat_app/controller/api_impl.dart';
import 'package:chat_app/controller/api_interface.dart';
import 'package:chat_app/presentation/bloc/openchannel_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // * Bloc
  sl.registerFactory(
    () => OpenchannelBloc(
      chatAPI: sl(),
    ),
  );

  // * API
  sl.registerLazySingleton<ChatAPI_Interface>(
    () => ChatAPI(client: sl()),
  );

  // external package

  sl.registerLazySingleton(() => http.Client());
}
