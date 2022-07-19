/*
import 'dart:convert';

import 'package:get_github_info/models/user_model.dart';
import 'package:http/http.dart';

class Network {
  static bool isTester = true;
  static String SERVER_DEVELOPMENT = "api.github.com";
  static String SERVER_PRODUCTION = "api.github.com";

  static String getServer() {
    if (isTester) return SERVER_DEVELOPMENT;
    return SERVER_PRODUCTION;
  }

  static Map<String, String> getHeaders() {
    Map<String, String> header = {'Accept': 'application/vnd.github.v3+json'};
    return header;
  }

  */
/* Http Requests *//*


  static Future<String?> GET(String api, Map<String, String> params) async {
    Uri uri = Uri.http(getServer(), api, params);
    var response = await get(uri, headers: getHeaders());
    if (response.statusCode == 200) return response.body;
    return null;
  }

  */
/* Http Apis *//*


  static String API_USER = "users/uzbmuydionov";
  //static String API_USER = "/users/uzbmuydionov";


  */
/* Http Parsing *//*


  static User parseUser(String response) {
    dynamic json = jsonDecode(response);
    return User.fromJson(json);
  }


}*/




import 'package:http/http.dart';

class Network {
  static String baseApi = "api.github.com";
  static Map<String, String> headers = {
    'Content-type': 'application/json'
  };

  // Http Api
  static String apiGet = '/users/uzbmuydinov';

  // Http requests
  static Future<String> getHttp(String api, Map<String, String> params) async {
    var uri = Uri.https(baseApi, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return 'null';
  }

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }
}