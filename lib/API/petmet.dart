import 'package:sql_conn/sql_conn.dart';

class PetsAPI{

  static const tblPet = "Pet";
  static const idDono = "id_dono";
  static const idPet = "id_pet";

  Future<Map> trazerMeusPets(int id_dono) async {
    var res = await SqlConn.readData("select * from $tblPet where $idDono = $id_dono");
    return res;
  }

  Future<Map> trazerPetSelecionado(int id_pet) async {
    var res = await SqlConn.readData("select * from $tblPet where $idPet = $id_pet");
    return res;
  }

  Future<int> cadPet(
    String nome_pet, String datanascePet, String raca, 
    String genero, String peso, String porte, 
    String vacinas, String obs, int idDono) async {
    var res = await SqlConn.writeData("exec usp_cadPet '$nome_pet','$datanascePet','$raca','$genero','$peso','$porte','$vacinas','$obs',$idDono");
    return res;
  }

  Future<int> atualizarDadosPet(
    String nome_pet, String raca, 
    String genero, String peso, String porte, 
    String vacinas, String obs, int idPet) async {
    var res = await SqlConn.writeData("exec usp_editarDadosPet $idPet,'$nome_pet','$raca','$genero','$peso','$porte','$vacinas','$obs'");
    return res;
  }

}