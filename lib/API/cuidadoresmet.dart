import 'dart:convert';

import 'package:http/http.dart' as http;

class CuidadoresAPI{
  Future<LoginResult> loginCuidadores(String usuario, String senha) async {
    final response = await http.get(Uri.parse("http://192.168.0.17/LoginFW.aspx?username=$usuario&password=$senha"));
    //lembrete: em caso de erro, verifique o ip ;)

    

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    List<String> responseArray = response.body.split("\n");
    return LoginResult.fromJson(jsonDecode(responseArray[0]));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
  }

  Future<ListResult> puxarServicos(String? token) async {
    if(token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://192.168.0.17/Cuidadores/Servicos/Puxar.aspx"),
      headers: <String, String>{
      'Authorization': token,
      }, 
    );
    //lembrete: em caso de erro, verifique o ip ;)

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<String> responseArray = response.body.split("\n");
    return ListResult.fromJson(jsonDecode(responseArray[0]));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
  }
}

class ServiceResult {
  final bool success;

  ServiceResult({
    required this.success,
  });

  factory ServiceResult.fromJson(Map<String, dynamic> json) {
    return ServiceResult(
      success: json['success']
    );
  }
}

class ListResult extends ServiceResult {
  final List<dynamic> resultados;

  ListResult({
    required bool success,
    required this.resultados,
  }) : super(success: success);

  factory ListResult.fromJson(Map<String, dynamic> json) {
    print(json);
    return ListResult(
      success: json['success'],
      resultados: List<dynamic>.from(json['Resultados'].map((x) => x))
    );
  }
}

class LoginResult extends ServiceResult {
  final String? token;

  LoginResult({
    required bool success,
    this.token,
  }) : super(success: success);

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      success: json['success'],
      token: json['token']
    );
  }
}