import 'dart:convert';

import 'package:http/http.dart' as http;

class PetsAPI {
  Future<ServiceResult> cadastroPet(
      String? token,
      String nome,
      String data,
      String raca,
      String gen,
      String peso,
      String porte,
      String vac,
      String descr,
      int idTipoPet) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    var request = http.MultipartRequest("POST",
        Uri.parse( "http://10.244.171.33/CadastrarPet.aspx?nome=$nome&data=$data&raca=$raca&genero=$gen&peso=$peso&porte=$porte&vacinacao=$vac&descricao=$descr&idTipoPet=$idTipoPet"));

    
        request.headers.addAll({"Authorization": token});

         http.StreamedResponse stream = await request.send();
    var response = await http.Response.fromStream(stream);
    print(response.body);
    return ServiceResult.fromJson(jsonDecode(response.body));
  }
}

class ServiceResult {
  final bool success;

  ServiceResult({
    required this.success,
  });

  factory ServiceResult.fromJson(Map<String, dynamic> json) {
    return ServiceResult(success: json['success']);
  }
}

class LoginResult extends ServiceResult {
  final String? token;

  LoginResult({
    required bool success,
    this.token,
  }) : super(success: success);

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(success: json['success'], token: json['token']);
  }
}
