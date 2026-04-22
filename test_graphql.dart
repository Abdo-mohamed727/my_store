import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  final query = r'''
mutation DeleteUser($id: ID!) {
  deleteUser(id: $id)
}
''';
  final response = await http.post(
    Uri.parse('https://api.escuelajs.co/graphql'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'query': query,
      'variables': {'id': "1"}, // just a test ID
    }),
  );

  print('Status: ${response.statusCode}');
  print('Body: ${response.body}');
}
