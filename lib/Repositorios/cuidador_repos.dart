import 'package:prjpetcare/API/cuidadoresmet.dart';

class CuidadorRopository{
  //api interna
  Future<int> loginCuidador(String usuario, String senha) async {
    CuidadoresAPI cuidadoresAPI = CuidadoresAPI();
    int result = await cuidadoresAPI.loginCuidadores(usuario, senha);
    return result;
  }
}