import 'package:evaluation_test/app/values/string.dart';
import 'package:evaluation_test/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService {
  UserService._initInstance();

  static UserService ins = UserService._initInstance();

  Future<http.Response> getUserData() async {
    return await http.get(
      Uri.parse("$db_uri/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  Future<http.Response> voteJoke(
      {required BuildContext context, required User user}) async {
    return await http.put(
      Uri.parse("$db_uri/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: user.toJson(),
    );
  }

  Future<http.Response> clearUserData() async {
    return await http.delete(
      Uri.parse("$db_uri/user"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
