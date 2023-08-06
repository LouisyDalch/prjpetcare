import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sql_conn/sql_conn.dart';

class TutorAPI{

  Future<LoginResult> loginTutor(String usuario,String senha) async {
    final response = await http.get(Uri.parse("http://192.168.0.17/LoginTutorFW.aspx?username=$usuario&password=$senha"));


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