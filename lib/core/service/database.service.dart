import 'package:calorie_tracker/supabase/supabase.credentials.dart';
import 'package:supabase/supabase.dart';

class DatabaseService {
  SupabaseCredentials supabaseCredentials = SupabaseCredentials();
  //fetch data
  Future fetchFooditems() async {
    try {
      var response = await supabaseCredentials.supabaseClient
          .from("food_items")
          .select()
          .execute();
      var data = response.data;
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<PostgrestResponse?> addDemoitems({
    required String name,
  }) async {
    try {
      PostgrestResponse? response = await supabaseCredentials.supabaseClient
          .from("demo_table")
          .insert({"name": name}).execute();

      if (response.data != null) {
        print(response.data);
      } else {
        print(response.error);
      }
      // print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }
}
