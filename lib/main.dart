import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/screens/screens.dart';
import 'package:calorie_tracker/supabase/supabase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Supabase.initialize(
  //   url: '[https://bougcsiwnimbmnmvwjlb.supabase.co]',
  //   anonKey: '[eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0Mzc5NzQyOCwiZXhwIjoxOTU5MzczNDI4fQ.Ac5s-ZOyUV-2rRoP_GUuPvdt7tGNocCSq-LU-ZtBVqQ]',
  // );
  runApp(const Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MyApp(),
      providers: AppProviders.providers,
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The initialRoute will and can be changed by people for
      // testing purposes to start the app to the screen they want to test.
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        'login': (context) => const LoginPage(),
        'leader_board': (context) => const LeaderBoard(),
        'meals': (context) => const MealsPage(),
        'demo_login': (context) => const LoginDemo(),
      },
      debugShowCheckedModeBanner: false,

      // home: HomeScreen(),
    );
  }
}
