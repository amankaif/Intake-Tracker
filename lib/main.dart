import 'package:calorie_tracker/screens/history_page/history_page_view.dart';
import 'package:calorie_tracker/widgets/bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calorie_tracker/screens/screens.dart';
import 'package:calorie_tracker/supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// SupabaseCredentials supabase = SupabaseCredentials();

Future<void> main() async {
  // await Supabase.initialize(
  //     url: "https://qtxfymhhhqauonnzqvpw.supabase.co",
  //     anonKey:
  //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF0eGZ5bWhoaHFhdW9ubnpxdnB3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTA1NTI1MTAsImV4cCI6MTk2NjEyODUxMH0.oxl9TMBh2bXh7CC_oBfFmIdONFod5X8QOtpY8Y7OWLU');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Core());

  // await Supabase.initialize(
  //   url: '[https://bougcsiwnimbmnmvwjlb.supabase.co]',
  //   anonKey: '[eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTY0Mzc5NzQyOCwiZXhwIjoxOTU5MzczNDI4fQ.Ac5s-ZOyUV-2rRoP_GUuPvdt7tGNocCSq-LU-ZtBVqQ]',
  // );
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
        '.': (context) => BottomNavigationBar_(),
        '/': (context) => const HomeScreen(),
        'login': (context) => const LoginPage(),
        'leader_board': (context) => const LeaderBoard(),
        'meals': (context) => const MealsPage(),
        'demo_login': (context) => const LoginDemo(),
        'splash': (context) => const SplashPage(),
        'history': (context) => const HistoryPage(),
      },
      debugShowCheckedModeBanner: false,

      // home: HomeScreen(),
    );
  }
}
