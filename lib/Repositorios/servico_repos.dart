import 'package:prjpetcare/API/servicosmet.dart';

class ServicosRopository{
  ServicosAPI servicosAPI = ServicosAPI();

  Future<Map> buscarDadosServico(int id_serv) async {
    Map result = await servicosAPI.buscarDadosServico(id_serv);
    return result;
  }

  Future<int> novoServ(String dataini, String datafin, int idTutor, int idCuidador) async {
    int result = await servicosAPI.novoServ(dataini, datafin, idTutor, idCuidador);
    return result;
  }

  Future<int> cancelarServ(int idServ) async {
    int result = await servicosAPI.cancelarServ(idServ);
    return result;
  }
  
}