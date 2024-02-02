import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';
import '../../API/tutoresmet.dart';
import '../../Elementos_design/design.dart';

//programar p trazer os dados já cadastrados :)

class EditarPerfPet_T extends StatefulWidget {
  final PetTutor pet;
  final String tipoPet;
  const EditarPerfPet_T({super.key,
  required this.pet,
  required this.tipoPet});

  @override
  State<EditarPerfPet_T> createState() => _EditarPerfPet_TState(
    pet: pet, tipoPet: tipoPet, tutorRopository: TutorRopository());
}

class _EditarPerfPet_TState extends State<EditarPerfPet_T> {
  PetTutor pet;
  String tipoPet;
  TutorRopository tutorRopository;
  _EditarPerfPet_TState({
    required this.pet,
    required this.tipoPet,
    required this.tutorRopository
  }) {
    _portSelect = portes[0];
    _vacSelect = vacinacao[0];
    
  }

  final portes = ["Pequeno", "Médio", "Grande"];
  String? _portSelect = "";

  final vacinacao = [
    "Possui todas as vacinas.",
    "Possui somente vacina antirrábica.",
    "Possui outras vacinas, menos a antirrábica.",
    "Não possui vacinas."
  ];
  String? _vacSelect = "";

  var imagemParaMandarProBanco = null;
  
  double peso = 0;
  
  int vac = 3;
  String descr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const WidBackground(),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.17,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                    "defora/imagens/fundoperfpet_edt.png"),
                                fit: BoxFit.cover)),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.018,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  CircleAvatar(
                                    radius: MediaQuery.of(context).size.width *
                                        0.13,
                                    backgroundColor:
                                        Color.fromARGB(255, 62, 170, 172),
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 96, 219, 168),
                                      backgroundImage: imageBytes != null
                                          ? MemoryImage(imageBytes!)
                                          : null,
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.11,
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    height: MediaQuery.of(context).size.height *
                                        0.06,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: ((context) =>
                                                opcoesImg()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Color.fromARGB(255, 62, 170, 172),
                                      ),
                                      child: Text(
                                        'Adicionar Foto',
                                        style: TextStyle(
                                            fontFamily: 'LilitaOne',
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),
                          )]),
                                ],),
                        
                          ]),
                        ]),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(children: [
                        Text(
                            "Nome: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05),
                          ),
                          Text(
                                  pet.nome,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.05),
                                )
                      ],),
                    ),
                     Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(children: [
                        Text(
                            "Data de nascimento: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05),
                          ),
                          Text(
                                  "${pet.dataNasce != null ? DateFormat('dd/MM/yyyy').format(pet.dataNasce!) : 'Data inválida'}",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.05),
                                )
                      ],),
                    ),

                     Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(children: [
                        Text(
                            "Gênero: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05),
                          ),
                          Text(
                                  pet.sexo,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.05),
                                )
                      ],),
                    ),
                     Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(children: [
                        Text(
                            "Raça: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05),
                          ),
                          Text(
                                  pet.raca,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.05),
                                )
                      ],),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(children: [
                        Text(
                            "Tipo do Pet: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05),
                          ),
                          Text(
                                  tipoPet,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width * 0.05),
                                )
                      ],),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.white,
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            onChanged: (Text) {
                              if(Text != null || Text!=""){
                                var amz = double.tryParse(Text);
                                peso = amz!;
                              }else{
                                peso = pet.peso;
                              }
                              
                            },
                            autocorrect: false,
                            keyboardType: TextInputType.number,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "",
                                labelText: "Peso (em kg)",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Porte",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.71,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: DropdownButtonFormField(
                            value: _portSelect,
                            items: portes.map((e) {
                              return DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                
                                _portSelect = val as String;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Color.fromRGBO(8, 113, 26, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Sobre a vacinação...",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: SingleChildScrollView(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: _vacSelect,
                          items: vacinacao.map((e) {
                            return DropdownMenuItem(
                              child: Text(
                                e,
                                overflow: TextOverflow.ellipsis,
                              ),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _vacSelect = val as String;
                              if (_vacSelect == vacinacao[0] as String) {
                                vac = 0;
                              } else if (_vacSelect == vacinacao[1] as String) {
                                vac = 1;
                              } else if (_vacSelect == vacinacao[2] as String) {
                                vac = 2;
                              } else if (_vacSelect == vacinacao[3] as String) {
                                vac = 3;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                            color: Color.fromRGBO(8, 113, 26, 1),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.white,
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            maxLines: 3,
                            onChanged: (Text) {
                              if(Text != null|| pet.descricao!=Text){
                                descr = Text;
                              }else{
                                descr = pet.descricao;
                              }
                              
                            },
                            autocorrect: false,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "",
                                labelText: "Descrição/Observações",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          Future<ServiceResult> cadastro =
                                        tutorRopository.editarPet(
                                           pet.idPet,
                                           peso.toString(),
                                           _portSelect.toString(),
                                           _vacSelect.toString(),
                                           descr

                                            );
                            Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(60, 115, 56, 1),
                        ),
                        child: Text(
                          'Salvar Alterações',
                          style: TextStyle(
                              fontFamily: 'LilitaOne',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ],
                ),
              ],
            )
    )]),
       
    );
  }

  final imagemPicker = ImagePicker();
  Uint8List? imageBytes;
  TutorRopository repository = TutorRopository();

  @override
  void initState() {
    super.initState();
  }

  pick(ImageSource source) async {
    final pickedFile = await imagemPicker.pickImage(source: source);

    if (pickedFile != null) {
      if (this.mounted) {
        var file = File(pickedFile.path);
        imagemParaMandarProBanco = await file.readAsBytes();

         ServiceResult result = await repository.CadastrarImgPet(imagemParaMandarProBanco,pet.nome);

        // print(result.success);

         setState(() {
         imageBytes = imagemParaMandarProBanco;
        });
       }
      }
    }

  Widget opcoesImg() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Center(
                child: Icon(
                  Icons.photo_library,
                  color: Colors.grey[500],
                ),
              ),
            ),
            title: Text(
              'Galeria',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () async {
              Navigator.of(context).pop();
              pick(ImageSource.gallery);
              //foto = utility.base64String(await imgFile.readAsBytes());
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Center(
                child: Icon(
                  Icons.photo_camera_back_rounded,
                  color: Colors.grey[500],
                ),
              ),
            ),
            title: Text(
              'Câmera',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () async {
              Navigator.of(context).pop();
              pick(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }
}
