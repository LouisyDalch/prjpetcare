import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prjpetcare/API/cuidadoresmet.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';

class EditarPerfilC extends StatefulWidget {
  const EditarPerfilC({super.key});

  @override
  State<EditarPerfilC> createState() => _EditarPerfilCState();
}

class _EditarPerfilCState extends State<EditarPerfilC> {
  String novoEmail = "";
  String confEmail = "";
  String celular = "";
  String complemento = ""; //endereço
  String numCasa = "";
  String bairro = "";
  String cidade = "";
  String cep = "";
  String uf = "";

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
                                      "defora/imagens/fundoeditarcuid.png"),
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
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
                                          Color.fromRGBO(219, 114, 38, 1),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromRGBO(219, 114, 38, 1),
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
                                              Color.fromRGBO(219, 114, 38, 1),
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
                              Text = novoEmail;
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
                              Text = confEmail;
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
                              Text = celular; //lembrete: colocar máscara
                            },
                            autocorrect: false,
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
                                      Text = cidade; //lembrete: colocar máscara
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
                                      Text = bairro; //lembrete: colocar máscara
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
                                          Text =
                                              complemento; //lembrete: colocar máscara
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
                                          Text =
                                              numCasa; //lembrete: colocar máscara
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
                                          Text = uf; //lembrete: colocar máscara
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
                                          Text =
                                              cep; //lembrete: colocar máscara
                                        },
                                        autocorrect: false,
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
                                  //programação
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(219, 114, 38, 1)),
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
  CuidadorRepository repository = CuidadorRepository();

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  void loadImage() async {
    var bytes = await repository.pegarFoto();
    setState(() => {imageBytes = bytes});
  }

  pick(ImageSource source) async {
    final pickedFile = await imagemPicker.pickImage(source: source);

    if (pickedFile != null) {
      if (this.mounted) {
        var file = File(pickedFile.path);
        var imagemParaMandarProBanco = await file.readAsBytes();

        ServiceResult result =
            await repository.salvarFoto(imagemParaMandarProBanco);

        print(result.success);

        setState(() {
          imageBytes = imagemParaMandarProBanco;
        });
      }
    }
  }

  String foto = "";

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
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Center(
                child: Icon(
                  Icons.no_photography_outlined,
                  color: Colors.grey[500],
                ),
              ),
            ),
            title: Text(
              'Remover Foto',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            onTap: () {
              setState(() async {});
            },
          ),
        ],
      ),
    );
  }
}
