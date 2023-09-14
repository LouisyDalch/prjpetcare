import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../Elementos_design/background.dart';
import '../../Elementos_design/design.dart';

class EditarPerfil_T extends StatefulWidget {
  const EditarPerfil_T({super.key});

  @override
  State<EditarPerfil_T> createState() => _EditarPerfil_TState();
}

class _EditarPerfil_TState extends State<EditarPerfil_T> {
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
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width * 0.35,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 6, 134, 36),
                                    shape: BoxShape.circle),
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
                                          0.02,
                                    ),
                                    GestureDetector(
                                      onTap: () => print("PROGRAMAÇÃO"),
                                      child: Text(
                                        "Editar Foto",
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.065,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
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
                                                border: const OutlineInputBorder()),
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
                                                border: const OutlineInputBorder()),
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
                            Container(height: MediaQuery.of(context).size.height * 0.04,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: ElevatedButton(
                                onPressed: () {
                                  //programação
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 15, 144, 36)
                                ),
                                child: Text(
                                  'Salvar Alterações',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      color: const Color.fromARGB(255, 0, 0, 0)),
                                ),
                              ),
                            ),
                            Container(height: MediaQuery.of(context).size.height * 0.04,),
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
}

