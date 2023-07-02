
import 'dart:convert';

import 'package:e_book_hub/models/auth/login/login_request_model.dart';
import 'package:e_book_hub/models/auth/login/login_response_model.dart';
import 'package:e_book_hub/models/auth/register/register_request_model.dart';
import 'package:e_book_hub/models/auth/register/register_response_model.dart';
import 'package:e_book_hub/utils/api.dart';
import 'package:http/http.dart' as http;

class AuthServices {

  static var client = http.Client();

  static Future<LoginResponseModel> login(LoginRequestModel model) async {

    print(model.email);

    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var url = Uri.parse(MyAPI.login);

      final response = await client.post(
          url,
          headers: requestHeaders,
          body: jsonEncode(model.toJson())
      );

      print(response.body);

      if (response.statusCode == 200) {
        print(response.body);
        final LoginResponseModel responseModel = LoginResponseModel.fromJson(jsonDecode(response.body));
        return responseModel;
      } else {
        print(response.body);
        final LoginResponseModel responseModel = LoginResponseModel.fromJson(jsonDecode(response.body));
        return responseModel;
        // return LoginResponseModel(status: response.statusCode, message: response.body);
      }
    } catch (e) {
      return LoginResponseModel(status: 404, message: e.toString());
    }

  }

  static Future<RegisterResponseModel> register(RegisterRequestModel model) async {

    try {
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      var url = Uri.parse(MyAPI.register);

      final response = await client.post(
          url,
          headers: requestHeaders,
          body: jsonEncode(model.toJson())
      );

      if (response.statusCode == 200) {
        final RegisterResponseModel responseModel = RegisterResponseModel.fromJson(jsonDecode(response.body));
        return responseModel;
      } else {
        return RegisterResponseModel(status: response.statusCode, message: response.body);
      }
    } catch (e) {
      return RegisterResponseModel(status: 404, message: e.toString());
    }

  }
}