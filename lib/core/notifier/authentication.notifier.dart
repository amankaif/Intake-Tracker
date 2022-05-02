// ignore_for_file: avoid_print


import 'package:calorie_tracker/core/service/authentication.service.dart';
import 'package:flutter/material.dart';

class AuthenticationNotifier extends ChangeNotifier {
  final AuthenticationService _authenticationService = AuthenticationService();
  Future<String?> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _authenticationService.signUp(
          context: context, email: email, password: password, );
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<String?> login(
     {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _authenticationService.login(
          context: context, email: email, password: password);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
