import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Cuidador/item_final_c.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Cuidador/item_pet_c.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_pet_t.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';

import '../../API/cuidadoresmet.dart';

class VisualTutor_C extends StatefulWidget {
  final TutorByCuid servico;
  const VisualTutor_C({super.key,
  required this.servico});

  @override
  State<VisualTutor_C> createState() => _VisualTutor_CState(servico: servico, cuidadorRepository: CuidadorRepository());
}

class _VisualTutor_CState extends State<VisualTutor_C> {
  TutorByCuid servico;
  CuidadorRepository cuidadorRepository;

  
  Uint8List? _imageData;

  Future<void> _loadImage() async {
    Uint8List data = await cuidadorRepository.getImageDataTutor(servico.idTutor);
    print("imagem carregou");
    setState(() {
      _imageData = data;
    });
  }

   @override
  void initState() {
    super.initState();
    loadPet();
    loadEndereco();
    _loadImage();
  }

  String rua = "";
  String bairro = "";
  String cidade = "";
  String uf = "";

  _VisualTutor_CState({
    required this.servico,
    required this.cuidadorRepository
  }):super();


  List<EndCuid> lstEnd = [];
  List<petCuid> lst = [];

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

  Future<ListResult> getPet() async {
    return await cuidadorRepository.puxarPetsTutor(servico.idTutor.toString());
  }

  Future<ListResult> getEndTutor() async {
    return await cuidadorRepository
        .puxarEndTutorCuid(servico.idTutor.toString());
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
      print(lst);
    });
  }

  //fundovistut
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("defora/imagens/fundovistut.png"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(height: MediaQuery.of(context).size.height * 0.1),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.brown,
                          image: _imageData != null
                                      ? DecorationImage(
                                          image: MemoryImage(_imageData!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.05),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                      ),
                      child: Column(
                        children: [
                          Text(
                            servico.nome,
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Text(
                                  _calcularIdade(servico.dataNasce!),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.055,
                                  ),textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Localização",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "$rua - $bairro, $cidade - $uf",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Formas de contato",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        servico.cell,
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        servico.email,
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                                  
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Meus Pets",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01),
                              Icon(
                                Icons.pets_sharp,
                                size: MediaQuery.of(context).size.width * 0.06,
                              )
                            ],
                          ),
                          ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: lst.length,
                              itemBuilder: (context, Index) {
                                petCuid a = lst[Index];
                                return ItemPet_C(pet: a,);
                              }),
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.08),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
