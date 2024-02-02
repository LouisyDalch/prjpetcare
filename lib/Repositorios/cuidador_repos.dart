import 'dart:typed_data';
import 'dart:ui';

import 'package:prjpetcare/API/cuidadoresmet.dart';
//aaa

class CuidadorRepository {
  static CuidadoresAPI cuidadoresAPI = CuidadoresAPI();
  static String? token;

  Future<LoginResult?> loginCuidadores(String usuario, String senha) async {
    return cuidadoresAPI.loginCuidadores(usuario, senha);
  }

  Future<ListResult> chamarImgCuidador() async {
    //vai ser usado p conf
    return cuidadoresAPI.chamarImagemCuidador(token);
  }

  Future<ListResult> puxarAgenda() async {
    //vai ser usado p conf
    return cuidadoresAPI.puxarAgenda(token);
  }

  Future<ListResult> puxarServicosSolic() async {
    return cuidadoresAPI.puxarServicosSolic(token);
  }

  Future<ListResult> puxarServConf() async {
    return cuidadoresAPI.puxarServConf(token);
  }

  Future<ListResult> puxarServFinal() async {
    return cuidadoresAPI.puxarServFinal(token);
  }

  Future<Uint8List> getImageDataTutor(int idTutor) async {
    return cuidadoresAPI.getImageDataTutor(token, idTutor);
  }

  Future<ServiceResult> salvarFoto(Uint8List img) async {
    return cuidadoresAPI.salvarFoto(token, img);
  }

  Future<Uint8List> pegarFoto() async {
    return cuidadoresAPI.pegarFoto(token);
  }

  Future<ListResult> puxarEndCuidador() async {
    return cuidadoresAPI.puxarEndCuidador(token);
  }

  Future<ListResult> puxarInfosCuid() async {
    return cuidadoresAPI.puxarInfosCuid(token);
  }

  Future<ServiceResult> alterarAgendaCuid(
      int dom, int seg, int ter, int qua, int qui, int sex, int sab) async {
    return cuidadoresAPI.alterarAgenda(
        token, dom, seg, ter, qua, qui, sex, sab);
  }

  Future<ListResult> puxarPetCuid(String idPet) async {
    return cuidadoresAPI.puxarPetCuid(token, idPet);
  }

  Future<ListResult> puxarPetsTutor(String idPet) async {
    return cuidadoresAPI.puxarPetsTutor(token, idPet);
  }
  

  Future<ListResult> puxarTutorCuid(String idTutor) async {
    return cuidadoresAPI.puxarDadosTutorCuid(token, idTutor);
  }

  Future<ListResult> puxarEndTutorCuid(String idTutor) async {
    return cuidadoresAPI.puxarEndTutorCuid(token, idTutor);
  }

  Future<ListResult> puxarTipoServ(String idTipoServ) async {
    return cuidadoresAPI.puxarTipoServ(token, idTipoServ);
  }

  Future<ServiceResult> atualizarDadosCuid(
      String email,
      String cell,
      String cidade,
      String bairro,
      String uf,
      String cep,
      String complemento,
      String rua,
      int numero,
      double valor) async {
    return cuidadoresAPI.atualizarDadosCuid(token, email, cell, cidade, bairro,
        uf, cep, complemento, rua, numero, valor);
  }

  Future<ServiceResult> atualizarAgenda(
      int dom, int seg, int ter, int qua, int qui, int sex, int sab) async {
    return cuidadoresAPI.atualizarAgenda(
        token, dom, seg, ter, qua, qui, sex, sab);
  }

  Future<ListResult> puxarDias() async {
    return cuidadoresAPI.puxarDias(token);
  }

   Future<Uint8List> getImagePet(int idPet) async {
        return cuidadoresAPI.getImagePet(token, idPet);
  }

   Future<ServiceResult> aceitarServico(
    int idServ
  )async{
    return cuidadoresAPI.aceitarServico(
      token, idServ);
  }

  Future<ServiceResult> deletarServico(
    int idServ
  )async{
    return cuidadoresAPI.deletarServico(
      token, idServ);
  }

   Future<ServiceResult> finalizarServico(
    int idServ
  )async{
    return cuidadoresAPI.finalizarServico(
      token, idServ);
  }
}

class objImgCuidador {
  ImageByteFormat? imgCuidador;
  objImgCuidador({required this.imgCuidador});
}

class TipoServ {
  int idTipoServ;
  int hosp;
  int creche;
  int petSitter;
  int passeio;
  int adestra;
  TipoServ(
      {required this.idTipoServ,
      required this.hosp,
      required this.creche,
      required this.petSitter,
      required this.passeio,
      required this.adestra});
}

class Dias {
  int idAgenda;
  int dom;
  int seg;
  int ter;
  int qua;
  int qui;
  int sex;
  int sab;
  Dias(
      {required this.idAgenda,
      required this.dom,
      required this.seg,
      required this.ter,
      required this.qua,
      required this.qui,
      required this.sex,
      required this.sab});
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
  TutorByCuid(
      {required this.idTutor,
      required this.nome,
      required this.email,
      required this.dataNasce,
      required this.cell,
      required this.cpf,
      required this.genero,
      required this.senha});
}

class petCuid {
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
  petCuid(
      {required this.idPet,
      required this.nome,
      required this.dataNasce,
      required this.raca,
      required this.sexo,
      required this.peso,
      required this.porte,
      required this.vacinacao,
      required this.descricao,
      required this.idDono,
      required this.idTipoPet});
}

class InfoCuid {
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

  InfoCuid(
      {required this.idCuidador,
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
      required this.idAgenda});
}

class EndCuid {
  int idEndereco;
  String rua;
  String bairro;
  int num;
  String comple;
  String cep;
  String cidade;
  String uf;

  EndCuid(
      {required this.idEndereco,
      required this.rua,
      required this.bairro,
      required this.num,
      required this.comple,
      required this.cep,
      required this.cidade,
      required this.uf});
}

class Servico {
  int idServ;
  DateTime? dataIni;
  DateTime? dataFin;
  double valor;
  int idDono;
  int idCuidador;
  int idPet;
  int idTipoServ;
  int idStatus;
  String donoNome;
  String nomePet;

  Servico({
    required this.idServ,
    required this.dataIni,
    required this.dataFin,
    required this.valor,
    required this.idDono,
    required this.idCuidador,
    required this.idPet,
    required this.idTipoServ,
    required this.idStatus,
    required this.donoNome,
    required this.nomePet,
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
