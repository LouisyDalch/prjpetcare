import 'package:prjpetcare/API/tutoresmet.dart';

class TutorRopository{
  Future<int> loginTutor(String usuario,String senha) async {
    TutorAPI tutorAPI = TutorAPI();
    int result = await tutorAPI.loginTutores(usuario, senha);
    return result;
  }
}