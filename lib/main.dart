import 'package:flutter/material.dart';
import 'package:calorie_tracker/screens/screens.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The initialRoute will and can be changed by people for testing purposes to start the app to the screen they want to test.
<<<<<<< Updated upstream
      initialRoute: 'login',
=======
      initialRoute: '/',
>>>>>>> Stashed changes
      routes: {
        '/': (context) => HomeScreen(),
        'login': (context) => const LoginPage(),
        'leader_board': (context) => const LeaderBoard(),
        'meals': (context) => const MealsPage()
      },

      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
    );
  }
}
