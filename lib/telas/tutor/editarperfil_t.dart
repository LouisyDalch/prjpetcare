import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';

import '../../API/tutoresmet.dart';
import '../../Elementos_design/background.dart';
import '../../Elementos_design/design.dart';

class EditarPerfil_T extends StatefulWidget {
  const EditarPerfil_T({
    super.key,
  });

  @override
  State<EditarPerfil_T> createState() =>
      _EditarPerfil_TState(tutorRopository: TutorRopository());
}

class _EditarPerfil_TState extends State<EditarPerfil_T> {
  TutorRopository tutorRopository;
  List<TutorByCuid> lstTutor = [];
  List<EndTutor> lstEnd = [];

  TextEditingController ufControl = TextEditingController();

  //mascaras:
  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskNum = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});
  final maskCep = MaskTextInputFormatter(
      mask: "#####-###", filter: {"#": RegExp(r'[0-9]')});

  _EditarPerfil_TState({required this.tutorRopository}) : super();

  Future<ListResult> getTutor() async {
    return await tutorRopository.puxarMeusDadosTutor();
  }

  Future<ListResult> getEnd() async {
    return await tutorRopository.puxarMeuEndTutor();
  }

  void loadTutor() async {
    ListResult tipoServico = await getTutor();
    setState(() {
      lstTutor = [];
      for (var element in tipoServico.resultados) {
        lstTutor.add(
          TutorByCuid(
              idTutor: element["idDono"],
              nome: element["nome"],
              email: element["email"],
              dataNasce: DateTime.tryParse(element['dataNasc']),
              cell: element["cell"],
              cpf: element["cpf"],
              genero: element["genero"],
              senha: element["senha"]),
        );
      }
      TutorByCuid t = lstTutor[0];
      email = t.email;
      confEmail = t.email;
      celular = t.cell;
    });
  }

  void loadEndereco() async {
    ListResult end = await getEnd();
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

  String email = "";
  String confEmail = "";
  String celular = "";
  String complemento = ""; //endereço
  int numCasa = 0;
  String bairro = "";
  String cidade = "";
  String cep = "";
  String uf = "";
  String rua = "";

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
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.17,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "defora/imagens/fundoeditartutor.png"),
                                  fit: BoxFit.cover)),
                        ),
                        Row(
                          children: [
                            Column(children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.013,
                              ),
                            ]),
                            Column(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.017,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    CircleAvatar(
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.13,
                                      backgroundColor:
                                          Color.fromRGBO(60, 115, 56, 1),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromRGBO(60, 115, 56, 1),
                                        backgroundImage: imageBytes != null
                                            ? MemoryImage(imageBytes!)
                                            : null,
                                        radius:
                                            MediaQuery.of(context).size.width *
                                                0.11,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                              Color.fromRGBO(60, 115, 56, 1),
                                        ),
                                        child: Text(
                                          'Modificar Foto',
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
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.white,
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            onChanged: (Text) {
                              if (Text != "" || Text != null) {
                                email = Text;
                              }
                            },
                            autocorrect: false,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "exemplo@gmail.com",
                                labelText: "Novo email",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.white,
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            onChanged: (Text) {
                              confEmail = Text;
                            },
                            autocorrect: false,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "exemplo@gmail.com",
                                labelText: "Confirmação de email",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.78,
                      height: MediaQuery.of(context).size.height * 0.002,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "Informações Pessoais",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.white,
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            
                            onChanged: (Text) {
                              if (Text != "" || Text != null) {
                                celular = Text;
                              } //lembrete: colocar máscara
                            },
                            autocorrect: false,
                            inputFormatters: [maskNum],
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "(11) 12345-6789",
                                labelText: "Celular",
                                border: const OutlineInputBorder()),
                            keyboardType: TextInputType.phone,
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.04,
                                ),
                                Text(
                                  "Endereço",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.8,
                              color: Colors.white,
                              child: Form(
                                  child: Column(
                                children: [
                                  TextFormField(
                                    onChanged: (Text) {
                                      if (Text != "" || Text != null) {
                                        cidade = Text;
                                      } //lembrete: colocar máscara
                                    },
                                    autocorrect: false,
                                    decoration: DesignEntradaTxt.decorarcaixa(
                                        hintText: "",
                                        labelText: "Cidade",
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
                              width: MediaQuery.of(context).size.width * 0.8,
                              color: Colors.white,
                              child: Form(
                                  child: Column(
                                children: [
                                  TextFormField(
                                    onChanged: (Text) {
                                      if (Text != "" || Text != null) {
                                        bairro = Text;
                                      } //lembrete: colocar máscara
                                    },
                                    autocorrect: false,
                                    decoration: DesignEntradaTxt.decorarcaixa(
                                        hintText: "",
                                        labelText: "Bairro",
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
                              width: MediaQuery.of(context).size.width * 0.8,
                              color: Colors.white,
                              child: Form(
                                  child: Column(
                                children: [
                                  TextFormField(
                                    onChanged: (Text) {
                                      if (Text != "" || Text != null) {
                                        rua = Text;
                                      } //lembrete: colocar máscara
                                    },
                                    autocorrect: false,
                                    decoration: DesignEntradaTxt.decorarcaixa(
                                        hintText: "",
                                        labelText: "Rua",
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
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  color: Colors.white,
                                  child: Form(
                                      child: Column(
                                    children: [
                                      TextFormField(
                                        onChanged: (Text) {
                                          if (Text != null) {
                                            complemento = Text;
                                          } //lembrete: colocar máscara
                                        },
                                        autocorrect: false,
                                        decoration:
                                            DesignEntradaTxt.decorarcaixa(
                                                hintText: "",
                                                labelText: "Complemento",
                                                border:
                                                    const OutlineInputBorder()),
                                      ),
                                    ],
                                  )),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.216,
                                  color: Colors.white,
                                  child: Form(
                                      child: Column(
                                    children: [
                                      TextFormField(
                                        onChanged: (Text) {
                                          if (Text != "" || Text != null) {
                                            numCasa = int.tryParse(Text)!;
                                          } //lembrete: colocar máscara
                                        },
                                        autocorrect: false,
                                        decoration:
                                            DesignEntradaTxt.decorarcaixa(
                                                hintText: "",
                                                labelText: "Número",
                                                border:
                                                    const OutlineInputBorder()),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  color: Colors.white,
                                  child: Form(
                                      child: Column(
                                    children: [
                                      TextFormField(
                                        onChanged: (Text) {
                                          if (Text != "" || Text != null) {
                                            String a = Text.toUpperCase();
                                            uf = a;
                                          } //lembrete: colocar máscara
                                        },
                                        autocorrect: false,
                                        decoration:
                                            DesignEntradaTxt.decorarcaixa(
                                                hintText: "",
                                                labelText: "UF",
                                                border:
                                                    const OutlineInputBorder()),
                                      ),
                                    ],
                                  )),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  width:
                                      MediaQuery.of(context).size.width * 0.571,
                                  color: Colors.white,
                                  child: Form(
                                      child: Column(
                                    children: [
                                      TextFormField(
                                        onChanged: (Text) {
                                          if (Text != "" || Text != null) {
                                            cep = Text;
                                          } //lembrete: colocar máscara
                                        },
                                        autocorrect: false,
                                        inputFormatters: [maskCep],
                                        decoration:
                                            DesignEntradaTxt.decorarcaixa(
                                                hintText: "",
                                                labelText: "CEP",
                                                border:
                                                    const OutlineInputBorder()),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ],
                                  )),
                                ),
                              ],
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (email == confEmail) {
                                    
                                    Future<ServiceResult> cadastro =
                                        tutorRopository.atualizarDadosTutor(
                                            email,
                                            celular,
                                            cidade,
                                            bairro,
                                            uf,
                                            cep,
                                            complemento,
                                            rua,
                                            numCasa);

                                    var snackBar = const SnackBar(
                                        content: Text(
                                      "Atualização realizada.",
                                      style: TextStyle(fontSize: 15),
                                    ));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  } else {
                                    var snackBar = const SnackBar(
                                        content: Text(
                                      "Confirmação de email ou email divergentes.",
                                      style: TextStyle(fontSize: 15),
                                    ));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 15, 144, 36)),
                                child: Text(
                                  'Salvar Alterações',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  final imagemPicker = ImagePicker();
  Uint8List? imageBytes;
  TutorRopository repository = TutorRopository();

  @override
  void initState() {
    super.initState();
    loadImage();
    loadEndereco();
    loadTutor();
  }

  void loadImage() async {
    var bytes = await repository.pegarMinhaFoto();
    setState(() => {imageBytes = bytes});
  }

  pick(ImageSource source) async {
    final pickedFile = await imagemPicker.pickImage(source: source);

    if (pickedFile != null) {
      if (this.mounted) {
        var file = File(pickedFile.path);
        var imagemParaMandarProBanco = await file.readAsBytes();

        ServiceResult result =
            await repository.salvarFotoTutor(imagemParaMandarProBanco);

        print(result.success);

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
