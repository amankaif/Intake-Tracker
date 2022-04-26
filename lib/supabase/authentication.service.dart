// ignore_for_file: avoid_print, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'supabase.credentials.dart';
// import 'supabase.credentials.dart';

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
      print("LogIn Successful: $userEmail");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("LogIn failed: ${response.error!.message}")));
      // ignore: avoid_print
      print("LogIn error: ${response.error!.message}");
    }
    return null;
  }
}
