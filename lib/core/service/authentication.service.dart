// ignore_for_file: avoid_print, duplicate_ignore

import 'package:calorie_tracker/ui_strings.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import '../../supabase/supabase.credentials.dart';
import 'package:calorie_tracker/core/persistent_data/persistent_data.dart';
// import 'supabase.credentials.dart';

// class AuthenticationService {
//   final _logger = Logger();
//   final _localStorageService = locator<LocalStorageService>();

//   AppUser? _user = null;
//   AppUser? get user => _user;
//   bool get hasUser => _user != null;

//   Future<void> initialize() async {}

//   Future<AppUser?> signIn({required AuthDto payload}) async {}

//   Future<AppUser?> signUp({required AuthDto payload}) async {}

//   Future<void> signOut() async {}

//   Future<AppUser?> fetchUser({required String id}) async {}

//   Future<PostgrestResponse> _createUser(User user, AuthDto payload) {}
// }

class AuthenticationService {
  SupabaseCredentials supabaseCredentials = SupabaseCredentials();

  Future<String?> signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    GotrueSessionResponse response =
        await supabaseCredentials.supabaseClient.auth.signUp(email, password);

    if (response.error == null) {
      String? userEmail = response.data!.user?.email;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Account SignUp successful: $email")));
      print("SignUp Successful: $userEmail");
      print("UserID:${supabaseCredentials.supabaseClient.auth.currentUser}");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("SignUp failed: ${response.error!.message}")));
      print("SignUp error: ${response.error!.message}");
    }
    return null;
  }

  Future<String?> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    GotrueSessionResponse response =
        await supabaseCredentials.supabaseClient.auth.signIn(
            email: email,
            password: password,
            options: AuthOptions(redirectTo: SupabaseCredentials.API_URL));

    if (response.error == null) {
      String? userEmail = response.data!.user?.email;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("LogIn successful: $email")));
      // ignore: avoid_print
      // print("LogIn Successful: $userEmail");
      final idUSER =
          await supabaseCredentials.supabaseClient.auth.currentUser?.id;
      QueryResults.userId = idUSER!;
      QueryResults.updateUserName();
      //  final userName = await supabaseCredentials.supabaseClient.
      Navigator.pushNamed(context, '.');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("LogIn failed: ${response.error!.message}")));
      // ignore: avoid_print
      print("LogIn error: ${response.error!.message}");
    }
    return null;
  }

    Future fetchConsumedData() async {
    try {
      var response = await supabaseCredentials.supabaseClient
          .from("meals_consumed")
          .select()
          .eq('id', QueryResults)
          .execute();
      var data = response.data;
      // print(data);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String?> _signOut() async {
    final response = await supabaseCredentials.supabaseClient.auth.signOut();
    final error = response.error;
    if (error != null) {
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text("LogOUt successful")));
    }
  }
}
