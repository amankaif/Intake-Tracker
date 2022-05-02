import 'package:calorie_tracker/core/notifier/authentication.notifier.dart';
import 'package:calorie_tracker/core/notifier/database.notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => AuthenticationNotifier(),
    ),
    ChangeNotifierProvider(
      create: (_) => DataBaseNotifier(),
    ),
  ];
}
