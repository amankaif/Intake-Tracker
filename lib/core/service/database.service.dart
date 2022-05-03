import 'package:calorie_tracker/supabase/supabase.credentials.dart';
import 'package:supabase/supabase.dart';
import 'package:calorie_tracker/core/persistent_data/persistent_data.dart';

class DatabaseService {
  SupabaseCredentials supabaseCredentials = SupabaseCredentials();
  //fetch data
  Future fetchFooditems({required String f_day, required String f_time}) async {
    try {
      var response = await supabaseCredentials.supabaseClient
          .from("food_items")
          .select()
          .eq('f_day', f_day.toLowerCase())
          .eq('f_meal_time', f_time.toLowerCase())
          .execute();
      var data = response.data;
      // print(data);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future fetchMealsPageItems() async {
    if (QueryResults.haveMealItemsPulled) {
      return [];
    }
    try {
      var responseNescafe =
          await supabaseCredentials.supabaseClient.from("food_items").select("""
*, food_outlets!inner(*)""").eq('food_outlets.f_outlet', 'nescafe').execute();
      var dataNescafe = responseNescafe.data;
      // print(dataNescafe);
      var responseHod =
          await supabaseCredentials.supabaseClient.from("food_items").select("""
*, food_outlets!inner(*)""").eq('food_outlets.f_outlet', 'hod').execute();
      var dataHod = responseHod.data;
      // print(dataHod);
      var responseTuckShop =
          await supabaseCredentials.supabaseClient.from("food_items").select("""
*, food_outlets!inner(*)""").eq('food_outlets.f_outlet', 'tuck shop').execute();
      var dataTuckShop = responseTuckShop.data;
      // print(dataNescafe);
      // print(dataHod);
      // print(dataTuck);
      return [dataNescafe, dataHod, dataTuckShop];
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
