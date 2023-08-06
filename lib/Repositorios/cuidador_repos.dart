import 'package:prjpetcare/API/cuidadoresmet.dart';

class CuidadorRepository {
  static CuidadoresAPI cuidadoresAPI = CuidadoresAPI();
  static String? token;

  Future<LoginResult> loginCuidadores(String usuario, String senha) async {
    return cuidadoresAPI.loginCuidadores(usuario, senha);
  }

  Future<ListResult> puxarServicos() async {
    return cuidadoresAPI.puxarServicos(token);
  }
}

class Servico {
  int idServ;
  DateTime? dataIni;
  DateTime? dataFin;
  int idDono;
  int idCuidador;
  int idStatus;
  String donoNome;
  String tipoServ;

  Servico({
    required this.idServ,
    required this.dataIni,
    required this.dataFin,
    required this.idDono,
    required this.idCuidador,
    required this.idStatus,
    required this.donoNome,
    required this.tipoServ
  });
}
