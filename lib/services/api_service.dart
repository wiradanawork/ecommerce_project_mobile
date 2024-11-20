import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api/';

  Future<List<dynamic>> fetchItems() async {
    final response = await http.get(Uri.parse('${baseUrl}items/'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<http.Response> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}login/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({'username': username, 'password': password}),
    );
    return response;
  }
}
