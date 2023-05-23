import 'dart:convert';

import 'package:flutter_auth_bloc/data/models/request/login_model.dart';
import 'package:flutter_auth_bloc/data/models/request/register_model.dart';
import 'package:flutter_auth_bloc/data/models/responses/login_response.dart';
import 'package:flutter_auth_bloc/data/models/responses/profile_response.dart';
import 'package:flutter_auth_bloc/data/models/responses/register_response.dart';
import 'package:http/http.dart' as http;

class AuthDatasource {
  get context => null;

  Future<RegisterResponseModel> register(RegisterModel regismodel) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/users/'),
      body: regismodel.toMap(),
    );

    final result = RegisterResponseModel.fromJson(response.body);
    return result;
  }

  Future<LoginResponseModel> login(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),
      body: loginModel.toMap(),
    );
    if (response.statusCode == 401) {
      throw Exception('Gagal login');
    } else {
      final result = LoginResponseModel.fromJson(response.body);
      return result;
    }
  }

  Future<ProfileResponseModel> profile() async {
    final response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/auth/profile'),
    );

    final result = ProfileResponseModel.fromJson(jsonDecode(response.body));

    return result;
  }
}
