import "package:chat_app/presentation/barrel.dart";

import 'dependecy_injection.dart' as injection;
import 'dependecy_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<OpenchannelBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LandingPage(),
        routes: {
          '/home': (context) => const HomePage(),
          '/chat': (context) => const ChatPage(),
        },
      ),
    );

    // child:
  }
}
