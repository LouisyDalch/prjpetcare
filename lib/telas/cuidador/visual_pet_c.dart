import 'dart:typed_data';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';
import 'package:prjpetcare/telas/cuidador/logado_c.dart';
import 'package:prjpetcare/telas/cuidador/perfil_c.dart';

class VisualizacaoPet_T extends StatefulWidget {
  final petCuid pet;
  VisualizacaoPet_T({super.key,
  required this.pet});

  @override
  State<VisualizacaoPet_T> createState() => _VisualizacaoPet_TState(pet: pet);
}

class _VisualizacaoPet_TState extends State<VisualizacaoPet_T> {
  String ptUm = "";
  String ptDois = "";
  CuidadorRepository cuidadorRepository = CuidadorRepository();
  petCuid pet;

  Uint8List? _imageDataPet;

  Future<void> _loadImagePet() async {
    Uint8List data = await cuidadorRepository.getImagePet(pet.idDono);
    print(data.length);
    if (mounted) {
      setState(() {
        _imageDataPet = data;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImagePet();
  }

  bool mais = true;

_VisualizacaoPet_TState({
  required this.pet
}):super();

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
    ptUm = pet.descricao;
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.8,
                      //color: Colors.green,
                      child: Row(children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.27,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(10),
                              image: _imageDataPet != null
                    ? DecorationImage(
                        image: MemoryImage(_imageDataPet!),
                        fit: BoxFit.cover,
                      )
                    : null,),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.14,
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Text(
                              pet.nome,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                              ),
                            ),
                            Text(
                              _calcularIdade(pet.dataNasce!),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Text(
                      "Informações do Pet",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      //height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(217, 217, 217, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "Data de Nascimento",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "${pet.dataNasce != null ? DateFormat('dd/MM/yyyy').format(pet.dataNasce!) : 
                                'Data inválida'}",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
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
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                pet.sexo,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
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
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                pet.raca,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
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
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                "${pet.peso}kg",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
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
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                pet.porte,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
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
                                "Status de vacinação:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Text(
                                  pet.vacinacao,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                  ),
                                ),
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
                                "Descrição:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ),
                            ],
                          ),
                          Container(
                             width: MediaQuery.of(context).size.width * 0.9,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,),
                            child: ptDois.isEmpty
                                ? Text(ptUm, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05,
                                ), textAlign: TextAlign.start,)
                                : Column(
                                    children: <Widget>[
                                      Text(
                                        mais ? (ptUm + "...") : (ptUm + ptDois),
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05),
                                      ),
                                      InkWell(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              mais
                                                  ? "mostrar mais"
                                                  : "mostrar menos",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      219, 114, 38, 1),
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.049),
                                            )
                                          ],
                                        ),
                                        onTap: () {
                                          setState(() {
                                            mais = !mais;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                          ),
                           Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
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
              MenuHorCuidador(),
            ],
          )
        ],
      ),
    );
  }
}
