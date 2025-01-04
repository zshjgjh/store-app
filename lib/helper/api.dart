import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
      http.Response response = await http.get(Uri.parse(url),headers: headers);
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        return throw Exception(
            'there was a statue code ${response.statusCode}');
      }
    }


    Future<dynamic> post(
        {required String url, @required dynamic body, @required String? token}) async {
      Map<String, String> headers = {};
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      http.Response response = await http.post(Uri.parse(url), body: body,headers: headers);
      if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);
          print(data);
          return data;

        } else {
          throw Exception('there is a problem with satucode${response
              .statusCode}with body${response.body}');
        }
      }

    Future<dynamic> put(
        {required String url, @required dynamic body, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url=$url ,body=$body');
    http.Response response = await http.put(Uri.parse(url), body: body,headers: headers);
    if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);
          print(data);
          return data;
        } else {
          throw Exception('there is a problem with satucode${response
              .statusCode}with body${response.body}');
        }
      }
    }



