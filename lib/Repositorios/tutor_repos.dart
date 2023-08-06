import 'package:prjpetcare/API/tutoresmet.dart';

class TutorRopository{
  static TutorAPI tutorAPI = TutorAPI();
  static String? token;
  
  Future<LoginResult> loginTutor(String usuario, String senha) async{
    return tutorAPI.loginTutor(usuario, senha);
  }

}