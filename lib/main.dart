import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/screens/screens.dart';
import 'package:calorie_tracker/supabase/supabase.dart';

void main() {
  runApp(Core());
}

class Core extends StatelessWidget {
  const Core({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: const MyApp(),
      providers: AppProviders.providers,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
