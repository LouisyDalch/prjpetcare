import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Repositorios/pet_repos.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';
import '../../API/tutoresmet.dart';
import '../../Elementos_design/design.dart';
import 'package:prjpetcare/API/petmet.dart' as petsAPI;

class AdicionarPet_T extends StatefulWidget {
  const AdicionarPet_T({super.key});

  @override
  State<AdicionarPet_T> createState() => _AdicionarPet_TState();
}

class _AdicionarPet_TState extends State<AdicionarPet_T> {
  _AdicionarPet_TState() {
    _genSelect = generos[2];
    _portSelect = portes[0];
    _vacSelect = vacinacao[3];
    _tipoSelect = tipoPets[0];
  }
  PetRopository petRopository = PetRopository();

  final generos = ["Feminino", "Masculino", "Desconhecido"];
  String? _genSelect = "";

  final portes = ["Pequeno", "Médio", "Grande"];
  String? _portSelect = "";

  final tipoPets = ["cão", "gato", "roedor", "peixe", "ave", "outro"];
  String? _tipoSelect ="";

  final vacinacao = [
    "Possui todas as vacinas.",
    "Possui somente vacina antirrábica.",
    "Possui outras vacinas, menos a antirrábica.",
    "Não possui vacinas."
  ];
  String? _vacSelect = "";

  String nome = "";
  String dataNasce = "";
  String especie = "";
  String peso = "";
  int vac = 3;
  String descr = "";
  DateTime data = DateTime.now();
  String datta = "";
  int idTipoPet = 1;

  var imagemParaMandarProBanco = null;

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
                                  )
                                ],),
                            ],),
                        ],)
                    ]),
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
                              setState(() {
                                nome = Text;
                              });
                            },
                            autocorrect: false,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "",
                                labelText: "Nome/Apelido",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Text(
                          "Data de Nascimento",
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ElevatedButton(
                        onPressed: () => _selectDate(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(7, 125, 27, 1),
                        ),
                        child: Text(
                          DateFormat("dd/MM/yyyy").format(data),
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              color: Color.fromARGB(255, 3, 65, 9)),
                        ),
                      ),
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
                              setState(() {
                                especie = Text;
                              });
                            },
                            autocorrect: false,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "",
                                labelText: "Espécie",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
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
                              setState(() {
                                peso = Text;
                              });
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
                          "Gênero",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Text(
                          "Porte",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.28,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButtonFormField(
                            value: _genSelect,
                            items: generos.map((e) {
                              return DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _genSelect = val.toString();
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Color.fromRGBO(8, 113, 26, 1),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.07,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.4,
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
                                _portSelect = val.toString();
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
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "O tipo do pet:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: SingleChildScrollView(
                            child: DropdownButtonFormField<int>(
                              isExpanded: true,
                              value: idTipoPet,
                              items: tipoPets.map((e) {
                                return DropdownMenuItem(
                                  child: Text(
                                    e,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: tipoPets.indexOf(e) + 1,
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  if(val != null) {
                                    idTipoPet = val;
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
                      ],
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
                              setState(() {
                                descr = Text;
                              });
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
                        onPressed: () async {
                          //ATENÇÃO
                          print(idTipoPet);

                          petsAPI.ServiceResult novoPet =
                              await petRopository.cadPet(
                                  nome,
                                  datta,
                                  especie,
                                  _genSelect.toString(),
                                  peso,
                                  _portSelect.toString(),
                                  _vacSelect.toString(),
                                  descr,
                                  idTipoPet);
                            ServiceResult result = await repository.CadastrarImgPet(imagemParaMandarProBanco,nome);
                            Navigator.pop(context);
                   
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(60, 115, 56, 1),
                        ),
                        child: Text(
                          'Adicionar Pet',
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
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(7, 125, 27, 1), // <-- SEE HERE
                onPrimary: Color.fromARGB(255, 3, 65, 9), // <-- SEE HERE
                onSurface: Color.fromARGB(255, 3, 65, 9),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    //primary: Colors.red, // button text color
                    ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: data,
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != data) {
      setState(() {
        var format = DateFormat("dd/MM/yyyy");
        datta = format.format(pickedDate);
        data = pickedDate;
      });
    }
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

         

        // print(result.success);

         setState(() {
         imageBytes = imagemParaMandarProBanco;
        });
       }
      }
    }

  Widget opcoesImg() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
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