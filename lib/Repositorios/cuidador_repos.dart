import 'package:prjpetcare/API/cuidadoresmet.dart';

class CuidadorRopository{
  CuidadoresAPI cuidadoresAPI = CuidadoresAPI();
  //api interna
  Future<int> loginCuidador(String usuario, String senha) async {
    int result = await cuidadoresAPI.loginCuidadores(usuario, senha);
    return result;
  }

  Future<Map> buscarCuidadores(String tiposerv, String nome, String tipopet) async {
    Map result = await cuidadoresAPI.buscarCuidadores(tiposerv, nome, tipopet);
    return result;
  }

  //talvez tenha q ser usado no web
  Future<int> salvarCadCuidadores(
    String nome, String email, String senha, String datanasce,
    String cell, String cpf, String genero, String especializacao, String tempoEsper
  ) async {
    int result = await cuidadoresAPI.salvarCadCuidadores(nome, email, senha, datanasce, cell, cpf, genero, especializacao, tempoEsper);
    return result;
  }

  Future<int> atualizarDadosCuidador(
    int id_Cuidador, String email, String cell, String especializacao, String tempoEsper
  ) async {
    int result = await cuidadoresAPI.atualizarDadosCuidador(id_Cuidador, email, cell, especializacao, tempoEsper);
    return result;
  }
}