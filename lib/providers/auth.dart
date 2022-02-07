import 'package:flutter/cupertino.dart';

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate = DateTime.now();
  late String _userId;

  bool get isAuth {
    return token != '';
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return '';
  }

  Future<void> _authenticate(
      String email, String password, String authMethod) async {
    final url = Uri.parse(
        "http://${dotenv.env['HOST']}:${dotenv.env['PORT']}/auth/$authMethod");
    try {
      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'userEmail': email,
          'password': password,
        }),
      );
      final responseData = json.decode(response.body);
      // print(responseData['error']);
      if (responseData['message'] != null) {
        throw HttpException(responseData['error']);
      }
      _token = responseData['token'];
      _userId = responseData['userId'];
      _expiryDate = DateTime.now().add(
        Duration(
          hours: 1,
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, "signup");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "login");
  }
}
