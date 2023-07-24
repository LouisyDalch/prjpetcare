import 'package:prjpetcare/API/petmet.dart';

class PetRopository{
  PetsAPI petsAPI = PetsAPI();

  Future<Map> buscarMeusPets(int id_dono) async {
    Map result = await petsAPI.trazerMeusPets(id_dono);
    return result;
  }

  Future<Map> buscarDadosPetSelecionado(int idPet) async {
    Map result = await petsAPI.trazerPetSelecionado(idPet);
    return result;
  }

  Future<int> cadastrarPet(
    String nome_pet,String datanascePet,String raca,String genero,
    String peso,String porte,String vacinas,String obs,int idDono) async {
    int result = await petsAPI.cadPet(
      nome_pet, datanascePet, raca, genero, peso, porte, vacinas, obs, idDono);
    return result;
  }

  Future<int> atualizarDadosPet(
    String nome_pet,String raca,String genero,String peso,String porte,
    String vacinas,String obs,int idPet
  ) async {
    int result = await petsAPI.atualizarDadosPet(nome_pet, raca, genero, peso, porte, vacinas, obs, idPet);
    return result;
  }
  
}