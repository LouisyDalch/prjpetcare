import 'package:prjpetcare/API/tutoresmet.dart';

class TutorRopository{
  TutorAPI tutorAPI = TutorAPI();
  Future<int> loginTutor(String usuario,String senha) async {
    int result = await tutorAPI.loginTutores(usuario, senha);
    return result;
  }

  Future<int> atualizarDadosTutor(int id_Tutor, String email, String cell) async {
    int result = await tutorAPI.atualizarDadosTutor(id_Tutor, email, cell);
    return result;
  }

  Future<int> cadTutor(
    String nome, String email, String datanasce, String cell, 
    String cpf, String genero, String senha
  ) async {
    int result = await tutorAPI.cadTutor(nome, email, datanasce, cell, cpf, genero, senha);
    return result;
  }

}