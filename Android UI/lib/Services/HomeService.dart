import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeServices {
  final headers = {'Content-Type': 'application/json'};

  Future<http.Response> getAllStockCompanies() async {
    var url = Uri.parse("http://10.0.2.2:5000/Home/GetAllStockCompanies");
    dynamic response = await http.get(url, headers: headers);
    return jsonDecode(response.body.replaceAll(r"\'", "'"));
  }
}
