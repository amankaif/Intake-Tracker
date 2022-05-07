import 'package:calorie_tracker/screens/home_page/home_page.dart';
import 'package:calorie_tracker/supabase/supabase.credentials.dart';
import 'package:calorie_tracker/ui_strings.dart';
import 'package:supabase/supabase.dart';
import 'package:calorie_tracker/core/persistent_data/persistent_data.dart';
import 'package:calorie_tracker/widgets/bottom_navigationbar.dart';

class QueryResults {
  static dynamic outletList;
  static dynamic entryList = [];
  static bool haveMealItemsPulled = false;
  static bool haveLeaderboardEntriesPulled = false;
  static int leadboardUserCalorieCount = 0;
  static late int leaderboardUserRank;
  static late String userId;
  static String userName = "Name not provided during registration";
  static late String foodName = '';
  static late int foodId;

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
        print(data);
        QueryResults.userName = data[0]["name"];
        print(foodName);
        // QueryResults.userName = QueryResults.userName[0].toUpperCase() +
        //     QueryResults.userName.substring(1);
        print(response.error);
        // NavBar.setState();
      }
    } catch (e) {
      print(e);
    }
  }

  static Future getFoodName() async {
    SupabaseCredentials supabaseCredentials = SupabaseCredentials();
    try {
      if (QueryResults.userId.isNotEmpty) {
        var response = await supabaseCredentials.supabaseClient
            .from("food_items")
            .select("f_name")
            .eq("fid", QueryResults.foodId)
            .execute();
        var data = response.data;
        print(data);
        QueryResults.foodName = data[0]["f_name"];
        print(response.error);
        // NavBar.setState();
      }
    } catch (e) {
      print(e);
    }
  }
}
