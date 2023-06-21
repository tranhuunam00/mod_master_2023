import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import '../configs/constants.dart';

class AuthenticationService {
  Future<dynamic> loginWithEmail(
      {required String email, required String password}) async {
    print(password);
    String uri = "${Constants.baseUrl}${Constants.userRoute}login";

    var response = await http.post(Uri.parse(uri),
        headers: Constants.requestHeaders,
        body: jsonEncode({"email": email, "password": password}));
    return response;
  }
}
