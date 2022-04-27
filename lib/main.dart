import 'package:calorie_tracker/widgets/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/screens/screens.dart';
import 'package:calorie_tracker/supabase/supabase.dart';

void main() {
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
      initialRoute: 'demo_login',
      routes: {
        '/': (context) => const HomeScreen(),
        'login': (context) => const LoginPage(),
        'leader_board': (context) => const LeaderBoard(),
        'meals': (context) => const MealsPage(),
        'demo_login': (context) => const LoginDemo(),
        '.': (context) => BottomNavigationBar_(),
      },
      debugShowCheckedModeBanner: false,

      // home: HomeScreen(),
    );
  }
}
