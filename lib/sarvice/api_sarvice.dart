import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tast_app/model/model.dart';

class ApiService {
static Future<List<UserModel>> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
    headers: {
      "Accept": "application/json",
      "User-Agent": "Mozilla/5.0",
    },
  );

  print(response.statusCode);

  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);
    return data.map((e) => UserModel.fromJson(e)).toList();
  } else {
    throw Exception("Error: ${response.statusCode}");
  }
}
}