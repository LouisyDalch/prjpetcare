import 'package:sql_conn/sql_conn.dart';

class ServicosAPI{

  static const idServico = "id_serv";

  Future<Map> buscarDadosServico(int id_servico) async {
    var res = await SqlConn.readData("select * from Servico where $idServico = $id_servico");
    return res;
  }

  Future<int> novoServ(String dataini, String datafin, int idTutor, int idCuidador) async {
    var res = await SqlConn.readData("exec usp_novoServ '$dataini','$datafin',$idTutor,$idCuidador");
    return res;
  }

  Future<int> cancelarServ(int idServ) async {
    var res = await SqlConn.readData("exec usp_cancelarServ $idServ");
    return res;
  }



}