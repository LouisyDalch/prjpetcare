import 'dart:convert';

import 'package:sql_conn/sql_conn.dart';
import 'package:http/http.dart' as http;

class PetsAPI{

  Future<ServiceResult> cadastroPet(
    String? token,
    String nome,String data, String raca, String gen, String peso,
    String porte, String vac, String descr, String foto) async {

    if(token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(Uri.parse(
      "http://10.244.171.33/CadastrarPet.aspx?nome=$nome&data=$data&raca=$raca&genero=$gen&peso=$peso&porte=$porte&vacinacao=$vac&descricao=$descr&foto=$foto"));


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