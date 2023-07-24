import 'package:prjpetcare/API/servicosmet.dart';

class ServicosRopository{
  Future<Map> buscarDadosServico(int id_serv) async {
    ServicosAPI servicosAPI = ServicosAPI();
    Map result = await servicosAPI.buscarDadosServico(id_serv);
    return result;
  }
}