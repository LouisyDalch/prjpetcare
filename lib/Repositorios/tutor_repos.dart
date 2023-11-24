import 'dart:ffi';

import 'package:prjpetcare/API/tutoresmet.dart';
//
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

  Future<ListResult> puxarCuidHosp() async {
    return tutorAPI.puxarCuidHosp(token);
  }

}

class TutorByCuid {
  int idTutor;
  String nome;
  String email;
  DateTime? dataNasce;
  String cell;
  String cpf;
  String genero;
  String senha;
  TutorByCuid({
    required this.idTutor,
    required this.nome,
    required this.email,
    required this.dataNasce,
    required this.cell,
    required this.cpf,
    required this.genero,
    required this.senha
  });
}

class InfoCuidP {
  int idCuidador;
  String nome;
  String email;
  DateTime? dataNasce;
  String telefone;
  String cpf;
  String genero;
  String senha;
  String especializacao;
  String tempoExper;
  double valor;
  int idEnd;
  int idTipoServ;
  int idTipoPet;
  int idAgenda;

  InfoCuidP({
    required this.idCuidador,
    required this.nome,
    required this.email,
    required this.dataNasce,
    required this.telefone,
    required this.cpf,
    required this.genero,
    required this.senha,
    required this.especializacao,
    required this.tempoExper,
    required this.valor,
    required this.idEnd,
    required this.idTipoServ,
    required this.idTipoPet,
    required this.idAgenda
  });

  
}