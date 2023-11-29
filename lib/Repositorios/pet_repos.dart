import 'package:prjpetcare/API/petmet.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';

class PetRopository{
  static PetsAPI petsAPI = PetsAPI();
  static String? token;

  Future<ServiceResult> cadPet (
    String nome,String data,String raca, String gen, String peso,
    String porte, String vacinacao, String descr, int idTipoPet
  )async{
    return petsAPI.cadastroPet(
      TutorRopository.token,nome, data, raca, gen, peso, porte, vacinacao, descr, idTipoPet);
  }
  
  
}