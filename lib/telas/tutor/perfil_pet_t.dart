import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';

import '../../API/tutoresmet.dart';
import '../../Repositorios/tutor_repos.dart';

//import 'package:auto_size_text/auto_size_text.dart';
//p programar
class PerfilPet_T extends StatefulWidget {
  final int idPet;
  const PerfilPet_T({super.key, required this.idPet});

  @override
  State<PerfilPet_T> createState() => _PerfilPet_TState(idPet: idPet);
}

class _PerfilPet_TState extends State<PerfilPet_T> {
  int idPet;

  //DADOS DE PREENCHIMENTO
  String nome = "";
  DateTime data = DateTime.now();
  String gen = "";
  double peso = 0;
  String porte = "";
  String raca = "";
  String vac = "";
  int tipoPet = 1;
  String obs = "";
  Uint8List? _imageData;

  _PerfilPet_TState({required this.idPet}) : super();

  List<PetTutor> lstPets = [];

  TutorRopository tutorRopository = TutorRopository();

  Future<ListResult> getPet() async {
    return await tutorRopository.puxarPet(idPet.toString());
  }

  @override
  void initState() {
    super.initState();
    loadPet();
    _loadImage();
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

   Future<void> _loadImage() async {
        
    Uint8List data = await tutorRopository.getImagePet(idPet);
    print(data.length);
    if(mounted){
      setState(() {
      _imageData = data;
    });
    }
  }

  String tipoAnimal(int s) {
    String _tipoAnimal = "";
    print(s);
    if (s == 1) {
      _tipoAnimal = "Cão";
    } else if (s == 2) {
      _tipoAnimal = "Gato";
    } else if (s == 3) {
      _tipoAnimal = "Roedor";
    } else if (s == 4) {
      _tipoAnimal = "Peixe";
    } else if (s == 5) {
      _tipoAnimal = "Ave";
    } else if (s == 6) {
      _tipoAnimal = "Outro";
    }
    print(_tipoAnimal);
    return _tipoAnimal;
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
          const WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              image:
                                  AssetImage("defora/imagens/fundoperfpet.png"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Informações do Pet",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width * 0.06),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        const Icon(Icons.border_color_outlined),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.45,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "Nome",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.055),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                nome,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05),
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "Data de Nascimento:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.055),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "${data != null ? DateFormat('dd/MM/yyyy').format(data) : 'Data inválida'}",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05),
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "Gênero",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.055),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                gen,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05),
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "Peso",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.055),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "${peso}kg",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05),
                              ),
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "Porte",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.055),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                porte,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05),
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "Raça",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.055),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                raca,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05),
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "Vacinação em dia?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.055),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  vac,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.05,
                                      overflow: TextOverflow.visible),
                                  maxLines: 2,
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  "Tipo do pet:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: MediaQuery.of(context).size.width *
                                          0.055),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(tipoAnimal(tipoPet),
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.05))
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    fullscreenDialog: false,
                                    builder: (context) => PopDescricao())),
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                Hero(
                                  tag: "descr",
                                  child: Text("Observações/Descrição",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.055)),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  obs,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.05,
                                      overflow: TextOverflow.ellipsis),
                                  maxLines: 3,
                                ),
                              )
                            ],
                          ),
                          Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                        ],),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const MenuHorTutor()
                  ],
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                nome,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Text(
                _calcularIdade(data),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent,
                    image: _imageData != null
                        ? DecorationImage(
                            image: MemoryImage(_imageData!),
                            fit: BoxFit.cover,
                        )
                          : null,),
                    
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
              ),
            ]),
          ]),
          
        ],
      ),
    );
  }
}

class PopDescricao extends StatelessWidget {
  const PopDescricao({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.center,
      child: Hero(
        tag: "descr",
        child: Scaffold(
            body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text("Sobre Belinha...",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.055))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.85,
                          child: SingleChildScrollView(
                            child: Text(
                                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from  by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
