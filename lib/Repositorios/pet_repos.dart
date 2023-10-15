import 'package:prjpetcare/API/petmet.dart';

class PetRopository{
  PetsAPI petsAPI = PetsAPI();
  static String? token;

  Future<ServiceResult> cadPet (
    String nome,String data,String raca, String gen, String peso,
    String porte, String vacinacao, String descr, String foto, 
  )async{
    return petsAPI.cadastroPet(
      token,nome, data, raca, gen, peso, porte, vacinacao, descr, foto);
  }
  
  
}