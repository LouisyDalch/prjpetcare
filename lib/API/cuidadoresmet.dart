import 'dart:convert';

import 'package:http/http.dart' as http;

class CuidadoresAPI{
  Future<LoginResult> loginCuidadores(String usuario, String senha) async {
    final response = await http.get(Uri.parse('http://10.244.171.33/LoginFW.aspx?username=' + usuario + "&password=" + senha));
    //lembrete: em caso de erro, verifique o ip ;)

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<String> responseArray = response.body.split("\n");
    return LoginResult.fromJson(jsonDecode(responseArray[0]));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
  }
}

class LoginResult {
  final bool success;
  final String? token;

  const LoginResult({
    required this.success,
    this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      success: json['success'],
      token: json['token'],
    );
  }
}