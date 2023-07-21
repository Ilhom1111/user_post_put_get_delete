import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:ip_addres_app/core/apis.dart';
import 'package:http/http.dart' as http;

import '../models/users_models.dart';

sealed class Networc {
  static Future<String?> methodGet({
    required String api,
    String baseUrl = Apis.baseUrl,
    Object? id,
    Map<String, String> headers = Apis.headers,
  }) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}");
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        return response.body.toString();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  static Future<void> methodDelete({
    required String api,
    String baseUrl = Apis.baseUrl,
    Object? id,
    Map<String, String> headers = Apis.headers,
  }) async {
    try {
      Uri url = Uri.https(baseUrl, "$api$id");
      final response = await http.delete(url, headers: headers);
      if (response.statusCode == 200) {
        debugPrint(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> methodPut({
    required String api,
    String baseUrl = Apis.baseUrl,
    String? id,
    Map<String, String> headers = Apis.headers,
    required Map<String, dynamic> data,
  }) async {
    try {
      final url =
          Uri.parse('https://64b3df1e0efb99d862687890.mockapi.io/user/$id');
      final response = await http.put(url, body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> methodPost({
    required String api,
    String baseUrl = Apis.baseUrl,
    Map<String, String> headers = Apis.headers,
    required Map<String, Object?> data,
  }) async {
    try {
      final url = Uri.parse('https://64b3df1e0efb99d862687890.mockapi.io/user');
      final response = await http.post(url, body: data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static List<User> parseUserList(String data) {
    final json = jsonDecode(data) as List;
    return json.map((item) => User.fromJson(item)).toList();
  }
}
