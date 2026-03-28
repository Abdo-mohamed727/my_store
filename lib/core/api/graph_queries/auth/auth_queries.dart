import 'package:my_store/features/auth/data/models/login_request_body.dart';
import 'package:my_store/features/auth/data/models/sign_up_request_body.dart';

class AuthQueries {
  factory AuthQueries() => _instance;
  const AuthQueries._();

  static const AuthQueries _instance = AuthQueries._();

  Map<String, dynamic> loginQuery({required LoginRequestBody data}) {
    return {
      'query': r'''
mutation Login($email: String!, $password: String!) {
  login(email: $email, password: $password) {
    access_token
    refresh_token
  }
}
''',
      'variables': {'email': data.email, 'password': data.password},
    };
  }

  Map<String, dynamic> signUpQuery({required SignUpRequestBody data}) {
    return {
      'query': r'''
mutation signUp($name: String!, $email: String!, $password: String!, $avatar: String!) {
  addUser(data: { name: $name, email: $email, password: $password, avatar: $avatar, role: customer }) {
    id
    email
  }
}
''',
      'variables': {
        'name': data.name,
        'email': data.email,
        'password': data.password,
        'avatar': data.avatar,
      },
    };
  }
}
