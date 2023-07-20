import 'package:sql_conn/sql_conn.dart';

class CuidadoresAPI{

  static const String tblCuidadores = 'Cuidador';
  static const String nomeB ="nome";
  static const String emailB ="email_cuidador";
  static const String senhaB ="senha";
  static const String datanasceB = "data_nasc";
  static const String cellB = "telefone";
  static const String cpfB ="cpf";
  static const String generoB = "genero";
  static const String especializacaoB = "especializacao";
  static const String tempoEsperB = "tempo_exper";


  Future<Map> buscarCuidadores(String nome, String tipopet) async {
    var res = await SqlConn.readData("exec usp_buscaCuidador '$nome','%$tipopet%'");
  }

  Future<Map> loginCuidadores(String servico, String usuario, String senha) async {
    var log = await SqlConn.readData("exec usp_loginCuidador '$servico','$usuario','$senha'");
  }

  Future<int> salvarCadCuidadores(
  String nome, email,
  String senha, datanasce, //converter data p date
  String cell, cpf, genero,
  String especializacao,
  String tempoEsper) async {
    var res = await SqlConn.writeData("exec usp_cadCuidador '$nome','$email','$datanasce','$cell','$cpf','$genero','$senha','$especializacao','$tempoEsper'");
  }

  Future<int> atualizarCadCuidador() async {
    var res = await SqlConn.writeData();
  }

  int deletarCadCuidador(){

  } 

}