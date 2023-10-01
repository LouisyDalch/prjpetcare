import 'dart:ffi';

import 'package:prjpetcare/API/tutoresmet.dart';

class TutorRopository{
  static TutorAPI tutorAPI = TutorAPI();
  static String? token;
  
  Future<LoginResult> loginTutor(String usuario, String senha) async{
    return tutorAPI.loginTutor(usuario, senha);
  }

  Future<ServiceResult> cadTutor (
    String nome,String email,String datanasce, String cell, String cpf,
    String genero, String senha, String cidade, String bairro, String uf,
    String cep, String complemento, int numero
  )async{
    return tutorAPI.cadastroTutor(
      nome, email, datanasce, cell, cpf, genero, senha, cidade, bairro, uf, cep, complemento, numero);
  }

}