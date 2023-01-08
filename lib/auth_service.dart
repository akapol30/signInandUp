import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:snackbar/error_handling.dart';
import 'package:snackbar/global_variables.dart';
import 'package:snackbar/user.dart';

import 'package:snackbar/utils.dart';


class AuthService {
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
        cart: [],
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
         // SharedPreferences prefs = await SharedPreferences.getInstance();
         // Provider.of<UserProvider>(context, listen: false).setUser(res.body);
         // await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
         // Navigator.pushNamedAndRemoveUntil(
         //   context,
         //   BottomBar.routeName,
         //   (route) => false,
         // );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  
}
