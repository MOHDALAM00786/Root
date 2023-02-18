import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  Future<http.Response> saveUser(Map<String, dynamic> request) async
  {
      var url = Uri.parse("http://10.0.2.2:5000/Users/AddUser");
      final headers = {'Content-Type': 'application/json'};
    dynamic response = await http.post(url, headers: headers, body: json.encode(request));
      Map<String, dynamic> responsePayload = json.decode(response.body);
    return response;
  }

  Future<http.Response> Login(Map<String, dynamic> request) async
  {
    var url = Uri.parse("http://10.0.2.2:5000/Users/Login");
    final headers = {'Content-Type': 'application/json'};
   return await http.post(url, headers: headers, body: json.encode(request));
  }
}