import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';
import 'package:prjpetcare/telas/cuidador/visual_pet_c.dart';
import 'package:prjpetcare/telas/cuidador/visual_tutor_c.dart';

import '../../API/cuidadoresmet.dart';

class VisualServFinal extends StatefulWidget {
  final ServicoSolic servico;
  final String nomeServico;
  const VisualServFinal(
      {super.key, required this.servico, required this.nomeServico});

  @override
  State<VisualServFinal> createState() => _VisualServFinalState(
      servico: servico,
      nomeServico: nomeServico,
      cuidadorRepository: CuidadorRepository());
}

class _VisualServFinalState extends State<VisualServFinal> {
  int _rating = 0;
  ServicoSolic servico;
  String nomeServico;
  CuidadorRepository cuidadorRepository;

  List<petCuid> lst = [];
  List<TutorByCuid> lstTutor = [];
  List<EndCuid> lstEnd = [];

  String nome = "";
  DateTime dataNasce1 = DateTime.now();

  String nomeTutor = "";
  DateTime dataNasceTut = DateTime.now();

  String rua = "";
  String bairro = "";
  String cidade = "";
  String uf = "";

  Uint8List? _imageData;
  Uint8List? _imageDataPet;

  _VisualServFinalState(
      {required this.servico,
      required this.nomeServico,
      required this.cuidadorRepository})
      : super();

  Future<ListResult> getPet() async {
    return await cuidadorRepository.puxarPetCuid(servico.idPet.toString());
  }

  Future<ListResult> getTutor() async {
    return await cuidadorRepository.puxarTutorCuid(servico.idDono.toString());
  }

  Future<ListResult> getEndTutor() async {
    return await cuidadorRepository
        .puxarEndTutorCuid(servico.idDono.toString());
  }

  @override
  void initState() {
    super.initState();
    loadPet();
    loadTutor();
    loadEndereco();
    _loadImage();
    _loadImagePet();
    //_loadImage();
  }

  Future<void> _loadImage() async {
    Uint8List data = await cuidadorRepository.getImageDataTutor(servico.idDono);
    print("imagem carregou");
    setState(() {
      _imageData = data;
    });
  }

  Future<void> _loadImagePet() async {
    Uint8List data = await cuidadorRepository.getImagePet(servico.idPet);
    print(data.length);
    if (mounted) {
      setState(() {
        _imageDataPet = data;
      });
    }
  }

  void loadPet() async {
    ListResult pet = await getPet();
    setState(() {
      lst = [];
      for (var element in pet.resultados) {
        lst.add(
          petCuid(
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
              idTipoPet: element["idTipoPet"]),
        );
      }
      petCuid petA = lst[0];
      nome = petA.nome;
      dataNasce1 = petA.dataNasce!;
    });
  }

  void loadTutor() async {
    ListResult tutor = await getTutor();
    setState(() {
      lstTutor = [];
      for (var element in tutor.resultados) {
        lstTutor.add(TutorByCuid(
            idTutor: element["idDono"],
            nome: element["nome"],
            email: element["email"],
            dataNasce: DateTime.tryParse(element['dataNasc']),
            cell: element["cell"],
            cpf: element["cpf"],
            genero: element["genero"],
            senha: element["senha"]));
      }
      TutorByCuid tutorA = lstTutor[0];
      nomeTutor = tutorA.nome;
      dataNasceTut = tutorA.dataNasce!;
    });
  }

  void loadEndereco() async {
    ListResult end = await getEndTutor();
    setState(() {
      lstEnd = [];
      for (var element in end.resultados) {
        lstEnd.add(EndCuid(
            idEndereco: element["idEndereco"],
            rua: element["rua"],
            bairro: element["bairro"],
            num: element["num"],
            comple: element["comple"],
            cep: element["cep"],
            cidade: element["cidade"],
            uf: element["uf"]));
      }
      EndCuid a = lstEnd[0];
      rua = a.rua;
      bairro = a.bairro;
      cidade = a.cidade;
      uf = a.uf;
    });
  }

  String _calcularIdade(DateTime dataNasceu) {
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
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        "Serviço Finalizado",
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
                                "Sobre o tutor",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              )),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(219, 114, 38, 1),
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
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    child: Text(
                                      nomeTutor,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child:
                                          Text(_calcularIdade(dataNasceTut))),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text(
                                          "$rua - $bairro, $cidade - $uf")),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: GestureDetector(
                                        onTap: () {
                                          TutorByCuid a = lstTutor[0];
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      VisualTutor_C(servico: a,))));
                                        },
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  219, 114, 38, 1),
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
                                    "Sobre o pet",
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
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(219, 114, 38, 1),
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
                                      child: Text(_calcularIdade(dataNasce1))),
                                  GestureDetector(
                                    onTap: () {
                                      petCuid a = lst[0];
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  VisualizacaoPet_T(pet: a,))));
                                    },
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.47,
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  219, 114, 38, 1),
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
                                "Modalidade: $nomeServico",
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
                                "Início: ${servico.dataIni != null ? DateFormat('dd/MM/yyyy').format(servico.dataIni!) : 'Data inválida'} às ${servico.dataIni != null ? DateFormat('hh:mm').format(servico.dataIni!) : 'Data inválida'}",
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
                                "Término: ${servico.dataFin != null ? DateFormat('dd/MM/yyyy').format(servico.dataFin!) : 'Data inválida'} às ${servico.dataFin != null ? DateFormat('hh:mm').format(servico.dataFin!) : 'Data inválida'}",
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
                                "Lucro total: R\$${servico.valor * 0.95}",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.88,
              ),
              MenuHorCuidador()
            ],
          )
        ],
      ),
    );
  }
}
