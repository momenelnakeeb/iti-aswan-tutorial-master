import 'package:http/http.dart' as http;
import 'package:iti_aswan_tutorial/services/constants.dart';
import 'dart:convert';

abstract class ServicesHandlerInterface {
  Future<dynamic> getService(String endPoint, {Map<String, String> headers});
  Future<dynamic> postService(String endPoint,
      {Map<String, String> headers, dynamic body});
}

class ServicesHandler implements ServicesHandlerInterface {
  Future<dynamic> getService(String endPoint,
      {Map<String, String> headers = const {
        'Content-Type': 'application/json'
      }}) async {
    try {
      Uri url = Uri.parse(Constants.BASE_URL + endPoint);

      http.Response response = await http.get(url, headers: headers);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Something wrong happened!');
      }
    } catch (error) {
      print('Http error: $error');
      throw Exception('Please check internet connection');
    }
  }

  Future<dynamic> postService(String endPoint,
      {Map<String, String> headers, dynamic body}) async {
    try {
      Uri url = Uri.parse(Constants.BASE_URL + endPoint);

      http.Response response =
          await http.post(url, headers: headers, body: body);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Something wrong happened!');
      }
    } catch (error) {
      print('Http error: $error');
      throw Exception('Please check internet connection');
    }
  }
}
