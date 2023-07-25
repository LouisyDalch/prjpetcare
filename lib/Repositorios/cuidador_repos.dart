import 'package:prjpetcare/API/cuidadoresmet.dart';

class CuidadorRepository{
  static CuidadoresAPI cuidadoresAPI = CuidadoresAPI();
  static String? token;
  
    Future<LoginResult> loginCuidadores(String usuario, String senha) async {
      return cuidadoresAPI.loginCuidadores(usuario, senha);
    }
}