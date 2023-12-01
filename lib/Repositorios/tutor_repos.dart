import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';

import 'package:prjpetcare/API/tutoresmet.dart';
//p programar
class TutorRopository{
  static TutorAPI tutorAPI = TutorAPI();
  static String? token;
  
  Future<LoginResult> loginTutor(String usuario, String senha) async{
    return tutorAPI.loginTutor(usuario, senha);
  }

  

  Future<ServiceResult> cadTutor (
    String nome,String email,String datanasce, String cell, String cpf,
    String genero, String senha, String cidade, String bairro, String uf,
    String cep, String complemento, int numero
  )async{
    return tutorAPI.cadastroTutor(
      nome, email, datanasce, cell, cpf, genero, senha, cidade, bairro, uf, cep, complemento, numero);
  }

  Future<ListResult> puxarCuidHosp() async {
    return tutorAPI.puxarCuidHosp(token);
  }

  Future<Uint8List> getImageDataTutor(int idCuid) async {
        return tutorAPI.getImageDataCuid(token, idCuid);
  }

  Future<ListResult> puxarEndCuidTutor(String idCuid) async {
    return tutorAPI.puxarEndCuidTutor(token, idCuid);
  }

  Future<ListResult> puxarSomaAval(String idCuid) async {
    return tutorAPI.puxarSomaAval(token, idCuid);
  }

   Future<ListResult> puxarTipoServTutor(
    String idTipoServ
  ) async {
    return tutorAPI.puxarTipoServTutor(token, idTipoServ);
  }

  Future<ListResult> puxarDias(
    String idAgenda
  ) async {
    return tutorAPI.puxarDias(token, idAgenda);
  }

   Future<ListResult> puxarTipoPet(
    String idTipoPet
  ) async {
    return tutorAPI.puxarTipoPet(token, idTipoPet);
  }

  Future<ListResult> puxarFeedbackTutor(
    String idCuid
  ) async {
    return tutorAPI.puxarFeedbackTutor(token, idCuid);
  }

  Future<ListResult> puxarDadosTutores(
    String idTutor
  ) async {
    return tutorAPI.puxarDadosTutores(token, idTutor);
  }

  Future<ListResult> puxarPetsDoTutor() async {
    return tutorAPI.puxarPetsDoTutor(token);
  }

  Future<Uint8List> getImagePet(int idPet) async {
        return tutorAPI.getImagePet(token, idPet);
  }

  Future<ServiceResult> CadastrarImgPet(Uint8List img, String nome) async {
        return tutorAPI.cadastrarImgPet(token, img, nome);
  }

  Future<ListResult> puxarPet(
    String idPet
  ) async {
    return tutorAPI.puxarPet(token, idPet);
  }

  Future<ListResult> puxarMeusDadosTutor(
  ) async {
    return tutorAPI.puxarMeusDadosTutor(token);
  }

  Future<ListResult> puxarMeuEndTutor(
  ) async {
    return tutorAPI.puxarMeuEndTutor(token);
  }

  Future<Uint8List> pegarMinhaFoto() async {
        return tutorAPI.pegarMinhaFoto(token);
  }

  Future<ServiceResult> salvarFotoTutor(Uint8List img) async {
        return tutorAPI.salvarFotoTutor(token, img);
  }

  Future<ServiceResult> atualizarDadosTutor (
    String email, String cell, String cidade, String bairro, String uf,
    String cep, String complemento, String rua, int numero
  )async{
    return tutorAPI.atualizarDadosTutor(
      token, email, cell, cidade, bairro, uf, cep, complemento, rua, numero);
  }

  Future<ServiceResult> cadastrarServHosp(
    String inicio, String fim, double valor, int estado, int idCuid, int idPet
  )async{
    return tutorAPI.cadastrarServHosp(
      token, inicio,fim,valor,estado,idCuid,idPet);
  }

  Future<ListResult> puxarServSolicTutor(
  ) async {
    return tutorAPI.puxarServSolicTutor(token);
  }

  Future<ListResult> puxarServConfTutor(
  ) async {
    return tutorAPI.puxarServConfTutor(token);
  }

  Future<ListResult> puxarServFinalTutor(
  ) async {
    return tutorAPI.puxarServFinalTutor(token);
  }

  Future<ListResult> puxarInfoCuidUM( int idCuid
  ) async {
    return tutorAPI.puxarInfoCuid(token, idCuid);
  }


}

class objImgTutor {
  ImageByteFormat? imgTutor;
  objImgTutor({
    required this.imgTutor
  });
}

class ServicoSolic {
  int idServ;
  DateTime? dataIni;
  DateTime? dataFin;
  double valor;
  int idStatus;
  int idDono;
  int idCuidador;
  int idPet;
  int idTipoServ;
  String donoNome;
  DateTime? dataDono;
  String nomePet;
  DateTime? dataPet;

  ServicoSolic({
    required this.idServ,
    required this.dataIni,
    required this.dataFin,
    required this.valor,
    required this.idStatus,
    required this.idDono,
    required this.idCuidador,
    required this.idPet,
    required this.idTipoServ,
    required this.donoNome,
    required this.dataDono,
    required this.nomePet,
    required this.dataPet,
  });
}

class PetTutor {
  int idPet;
  String nome;
  DateTime? dataNasce;
  String raca;
  String sexo;
  double peso;
  String porte;
  String vacinacao;
  String descricao;
  int idDono;
  int idTipoPet;
  PetTutor({
    required this.idPet,
    required this.nome,
    required this.dataNasce,
    required this.raca,
    required this.sexo,
    required this.peso,
    required this.porte,
    required this.vacinacao,
    required this.descricao,
    required this.idDono,
    required this.idTipoPet
  });
}

class FeedbackTutor {
  String coment;
  DateTime? data;
  int aval;
  int idTutor;
  int idCuid;
  FeedbackTutor({
    required this.coment,
    required this.data,
    required this.aval,
    required this.idTutor,
    required this.idCuid
  });
}

class TipoPet {
  int idTipoPet;
  int cao;
  int gato;
  int roedor;
  int peixe;
  int aves;
  int outros;
  TipoPet({
    required this.idTipoPet,
    required this.cao,
    required this.gato,
    required this.roedor,
    required this.peixe,
    required this.aves,
    required this.outros
  });
}

class DiasTutor {
  int idAgenda;
  int dom;
  int seg;
  int ter;
  int qua;
  int qui;
  int sex;
  int sab;
  DiasTutor({
    required this.idAgenda,
    required this.dom,
    required this.seg,
    required this.ter,
    required this.qua,
    required this.qui,
    required this.sex,
    required this.sab
  });
}

class TipoServT {
  int idTipoServ;
  int hosp;
  int creche;
  int petSitter;
  int passeio;
  int adestra;
  TipoServT({
    required this.idTipoServ,
    required this.hosp,
    required this.creche,
    required this.petSitter,
    required this.passeio,
    required this.adestra
  });
}

class TutorByCuid {
  int idTutor;
  String nome;
  String email;
  DateTime? dataNasce;
  String cell;
  String cpf;
  String genero;
  String senha;
  TutorByCuid({
    required this.idTutor,
    required this.nome,
    required this.email,
    required this.dataNasce,
    required this.cell,
    required this.cpf,
    required this.genero,
    required this.senha
  });
}

class SomaAval {
  int somaAval;
  SomaAval({
    required this.somaAval
  });
}

class InfoCuidP {
  int idCuidador;
  String nome;
  String email;
  DateTime? dataNasce;
  String telefone;
  String cpf;
  String genero;
  String senha;
  String especializacao;
  String tempoExper;
  double valor;
  int idEnd;
  int idTipoServ;
  int idTipoPet;
  int idAgenda;

  InfoCuidP({
    required this.idCuidador,
    required this.nome,
    required this.email,
    required this.dataNasce,
    required this.telefone,
    required this.cpf,
    required this.genero,
    required this.senha,
    required this.especializacao,
    required this.tempoExper,
    required this.valor,
    required this.idEnd,
    required this.idTipoServ,
    required this.idTipoPet,
    required this.idAgenda
  });

  

  
}

class EndTutor {
  int idEndereco;
  String rua;
  String bairro;
  int num;
  String comple;
  String cep;
  String cidade;
  String uf;

  EndTutor({
    required this.idEndereco,
    required this.rua,
    required this.bairro,
    required this.num,
    required this.comple,
    required this.cep,
    required this.cidade,
    required this.uf
  });

  
}