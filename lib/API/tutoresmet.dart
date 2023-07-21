import 'package:sql_conn/sql_conn.dart';

class TutorAPI{

  Future<Map> loginTutores (String usuario, String senha) async {
    var res = await SqlConn.readData("exec usp_loginTutores '$usuario','$senha'");
    return res;
  }

  Future<int> atualizarDadosTutor(int id_Tutor, String email, String cell) async {
    var res = await SqlConn.writeData("exec usp_editarDadorTutor $id_Tutor,'$email','$cell'");
    return res;
  }

  Future<int> cadTutor(String nome, String email, String datanasce, String cell, String cpf, String genero, String senha) async {
    var res = await SqlConn.writeData("exec usp_cadTutor '$nome','$email','$datanasce','$cell','$cpf','$genero','$senha'");
    return res;
  }

}