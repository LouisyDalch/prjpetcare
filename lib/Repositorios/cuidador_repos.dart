import 'dart:typed_data';
import 'dart:ui';

import 'package:prjpetcare/API/cuidadoresmet.dart';


class CuidadorRepository {
  static CuidadoresAPI cuidadoresAPI = CuidadoresAPI();
  static String? token;

  Future<LoginResult?> loginCuidadores(String usuario, String senha) async {
    return cuidadoresAPI.loginCuidadores(usuario, senha);
  }

  Future<ListResult> chamarImgCuidador() async { //vai ser usado p conf
    return cuidadoresAPI.chamarImagemCuidador(token);
  }
  
  Future<ListResult> puxarAgenda() async { //vai ser usado p conf
    return cuidadoresAPI.puxarAgenda(token);
  }

  Future<ListResult> puxarServicosSolic() async {
    return cuidadoresAPI.puxarServicosSolic(token);
  }

  Future<ListResult> puxarServConf() async {
    return cuidadoresAPI.puxarServConf(token);
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
    int dom, int seg, int ter, int qua, int qui, int sex, int sab
  ) async {
    return cuidadoresAPI.alterarAgenda(token, dom, seg, ter, qua, qui, sex, sab);
  }

  Future<ListResult> puxarPetCuid(
    String idPet
  ) async {
    return cuidadoresAPI.puxarPetCuid(token, idPet);
  }

  Future<ListResult> puxarTutorCuid(
    String idTutor
  ) async {
    return cuidadoresAPI.puxarDadosTutorCuid(token, idTutor);
  }

  Future<ListResult> puxarEndTutorCuid(
    String idTutor
  ) async {
    return cuidadoresAPI.puxarEndTutorCuid(token, idTutor);
  }

}

class objImgCuidador {
  ImageByteFormat? imgCuidador;
  objImgCuidador({
    required this.imgCuidador
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
  petCuid({
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

  InfoCuid({
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

class EndCuid {
  int idEndereco;
  String rua;
  String bairro;
  int num;
  String comple;
  String cep;
  String cidade;
  String uf;

  EndCuid({
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
  String tipoServ;

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
    required this.tipoServ,
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
  String tipoServ;

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
    required this.tipoServ,
  });

  
}
