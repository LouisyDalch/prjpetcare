import 'package:sql_conn/sql_conn.dart';

class ServicosAPI{

  static const idServico = "id_serv";

  Future<Map> buscarDadosServico(int id_servico) async {
    var res = await SqlConn.readData("select * from Servico where $idServico = $id_servico");
    return res;
  }

  Future<int> cadServicoGeral() async {
    var res = await SqlConn.readData("");
    return res;
  }

}