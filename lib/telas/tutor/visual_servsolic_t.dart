import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';
import 'package:prjpetcare/telas/tutor/perfil_pet_t.dart';
import 'package:prjpetcare/telas/tutor/visual_cuidador_t.dart';

import '../../API/tutoresmet.dart';

class VisualServSolic_T extends StatefulWidget {
  final ServicoSolic servico;
  final String tipoServ;
  const VisualServSolic_T(
      {super.key, required this.servico, required this.tipoServ});

  @override
  State<VisualServSolic_T> createState() => _VisualServSolic_TState(
      servico: servico, tutorRopository: TutorRopository(), tipoServ: tipoServ);
}

class _VisualServSolic_TState extends State<VisualServSolic_T> {
  ServicoSolic servico;
  String tipoServ;
  TutorRopository tutorRopository;

  _VisualServSolic_TState(
      {required this.servico,
      required this.tutorRopository,
      required this.tipoServ})
      : super();

  List<InfoCuidP> lstCuid = [];
  List<PetTutor> lstPets = [];
  List<EndTutor> lstEnd = [];

  String nomeCuid = "";
  DateTime dataNasceu = DateTime.now();
  double valor = 0.0;
  String cell = "";
  String email = "";
  int idTipoServ = 0;
  int idAgenda = 0;
  int idTipoPet = 0;
  double valorBD = 0.0;

  String nome = "";
  DateTime data = DateTime.now();
  String gen = "";
  double peso = 0;
  String porte = "";
  String raca = "";
  String vac = "";
  int tipoPet = 1;
  String obs = "";

  String rua = "";
  String bairro = "";
  String cidade = "";
  String uf = "";

  Uint8List? _imageData;
  Uint8List? _imageDataPet;

  void initState() {
    super.initState();
    loadInfos();
    loadPet();
    _loadImage();
    _loadImagePet();
    loadEndereco();
  }

  Future<ListResult> getInfoCuid() async {
    return await tutorRopository.puxarInfoCuidUM(servico.idCuidador);
  }

  Future<ListResult> getPet() async {
    return await tutorRopository.puxarPet(servico.idPet.toString());
  }

  Future<ListResult> getEndCuid() async {
    return await tutorRopository.puxarEndCuidTutor(servico.idCuidador.toString());
  }

  void loadInfos() async {
    ListResult infos = await getInfoCuid();
    setState(() {
      lstCuid = [];
      for (var element in infos.resultados) {
        lstCuid.add(InfoCuidP(
            idCuidador: element['id_cuidador'],
            nome: element["nome"],
            email: element["email"],
            dataNasce: DateTime.tryParse(element["datanasce"]),
            telefone: element["telefone"],
            cpf: element["cpf"],
            genero: element["genero"],
            senha: element["senha"],
            especializacao: element["especializacao"],
            tempoExper: element["tempoexper"],
            valor: element["valor"],
            idEnd: element["id_end"],
            idTipoServ: element["id_tipoServ"],
            idTipoPet: element["id_TipoPet"],
            idAgenda: element["id_Agenda"]));
      }
      InfoCuidP a = lstCuid[0];
      nomeCuid = a.nome;
      dataNasceu = a.dataNasce!;
      valor = a.valor;
      cell = a.telefone;
      email = a.email;
      idTipoServ = a.idTipoServ;
      idAgenda = a.idAgenda;
      idTipoPet = a.idTipoPet;
      valorBD = a.valor;
    });
  }

  void loadPet() async {
    ListResult infos = await getPet();
    setState(() {
      lstPets = [];
      for (var element in infos.resultados) {
        lstPets.add(PetTutor(
            idPet: element['idPet'],
            nome: element["nome"],
            dataNasce: DateTime.tryParse(element['data']),
            raca: element["raca"],
            sexo: element["sexo"],
            peso: element["peso"],
            porte: element["porte"],
            vacinacao: element['vacinacao'],
            descricao: element['descricao'],
            idDono: element["idDono"],
            idTipoPet: element["idTipoPet"]));
      }
      PetTutor pet = lstPets[0];
      nome = pet.nome;
      data = pet.dataNasce!;
      gen = pet.sexo;
      peso = pet.peso;
      porte = pet.porte;
      raca = pet.raca;
      vac = pet.vacinacao;
      tipoPet = pet.idTipoPet;
      obs = pet.descricao;
    });
  }

   void loadEndereco() async {
    ListResult end = await getEndCuid();
    setState(() {
      for (var element in end.resultados) {
        lstEnd = [];
        lstEnd.add(EndTutor(
            idEndereco: element["idEndereco"],
            rua: element["rua"],
            bairro: element["bairro"],
            num: element["num"],
            comple: element["comple"],
            cep: element["cep"],
            cidade: element["cidade"],
            uf: element["uf"]));
      }
      EndTutor a = lstEnd[0];
      rua = a.rua;
      bairro = a.bairro;
      cidade = a.cidade;
      uf = a.uf;
    });
  }

  Future<void> _loadImage() async {
    Uint8List data =
        await tutorRopository.getImageDataTutor(servico.idCuidador);
    print("imagem carregou");
    setState(() {
      _imageData = data;
    });
  }

  Future<void> _loadImagePet() async {
    Uint8List data = await tutorRopository.getImagePet(servico.idPet);
    print(data.length);
    if (mounted) {
      setState(() {
        _imageDataPet = data;
      });
    }
  }

  int _calcularIdade(DateTime dataNasceu) {
    DateTime verifica =
        DateTime(DateTime.now().year, dataNasceu.month, dataNasceu.day);
    DateTime hoje = DateTime.now();
    int idade;
    if (DateTime.now().isBefore(verifica)) {
      idade = hoje.year - dataNasceu.year - 1;
    } else {
      idade = hoje.year - dataNasceu.year;
    }
    return idade;
  }

  String _calcularIdadePet(DateTime dataNasceu) {
    DateTime verifica =
        DateTime(DateTime.now().year, dataNasceu.month, dataNasceu.day);
    DateTime hoje = DateTime.now();
    int idade;
    int mes;
    if (DateTime.now().isBefore(verifica)) {
      idade = hoje.year - dataNasceu.year - 1;
    } else {
      idade = hoje.year - dataNasceu.year;
    }
    String a;

    if (idade > 0) {
      a = "$idade anos";
    } else {
      //calcular meses
      int mes = hoje.month - dataNasceu.month;
      if (mes > 1) {
        a = "$mes meses";
      } else {
        if (hoje.day > dataNasceu.day) {
          a = "$mes mês";
        } else {
          final mds = hoje.difference(dataNasceu).inDays;
          a = "$mds dias";
        }
      }
    }

    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      "Serviço Solicitado",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.06),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(143, 153, 153, 153),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              "Sobre o cuidador",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            )),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.15,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(8, 105, 16, 1),
                                shape: BoxShape.circle,
                                image: _imageData != null
                                    ? DecorationImage(
                                        image: MemoryImage(_imageData!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Column(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  child: Text(
                                    nomeCuid,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    child: Text(
                                        "${_calcularIdade(dataNasceu)} anos")),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    child: Text("$rua - $bairro, $cidade - $uf")),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  VisualCuidador_T(
                                                      idCuid: servico
                                                          .idCuidador, btnSolic: false,
                                                          tipoServ: "Sem")))),
                                      child: Text(
                                        "Saber mais",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(8, 105, 16, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045),
                                      ),
                                    ))
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Text(
                                  "Meu pet",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05),
                                ),
                              ],
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.12,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(8, 105, 16, 1),
                                borderRadius: BorderRadius.circular(10),
                                image: _imageDataPet != null
                                    ? DecorationImage(
                                        image: MemoryImage(_imageDataPet!),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            Column(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    child: Text(
                                      nome,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    child: Text(_calcularIdadePet(data))),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => PerfilPet_T(
                                              idPet: servico.idPet)))),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text(
                                        "Saber mais",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(8, 105, 16, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045),
                                      )),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.004,
                          width: MediaQuery.of(context).size.width * 0.85,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              "Modalidade: $tipoServ",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              "Início: ${servico.dataIni != null ? DateFormat('dd/MM/yyyy').format(servico.dataIni!) : 'Data inválida'} às ${servico.dataIni != null ? DateFormat('hh:mm a').format(servico.dataIni!) : 'Data inválida'}",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              "Término: ${servico.dataIni != null ? DateFormat('dd/MM/yyyy').format(servico.dataIni!) : 'Data inválida'} às ${servico.dataFin != null ? DateFormat('hh:mm a').format(servico.dataFin!) : 'Data inválida'}",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  MenuHorTutor()
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
