import 'package:calorie_tracker/screens/home_page/home_page.dart';
import 'package:calorie_tracker/supabase/supabase.credentials.dart';
import 'package:calorie_tracker/ui_strings.dart';
import 'package:supabase/supabase.dart';
import 'package:calorie_tracker/core/persistent_data/persistent_data.dart';
import 'package:calorie_tracker/widgets/bottom_navigationbar.dart';

class QueryResults {
  static dynamic outletList;
  static bool haveMealItemsPulled = false;
  static late String userId;
  static String userName = "Name not provided during registration";

  static Future updateUserName() async {
    SupabaseCredentials supabaseCredentials = SupabaseCredentials();
    try {
      if (QueryResults.userId.isNotEmpty) {
        var response = await supabaseCredentials.supabaseClient
            .from("user_details")
            .select("name")
            .eq("id", QueryResults.userId)
            .execute();
        var data = response.data;
        QueryResults.userName = data[0]["name"];
        QueryResults.userName = QueryResults.userName[0].toUpperCase() +
            QueryResults.userName.substring(1);
        print(response.error);
        // NavBar.setState();
      }
    } catch (e) {
      print(e);
    }
  }
}
