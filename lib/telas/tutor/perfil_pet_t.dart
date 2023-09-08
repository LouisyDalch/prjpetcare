import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
//import 'package:auto_size_text/auto_size_text.dart';

class PerfilPet_T extends StatefulWidget {
  const PerfilPet_T({super.key});

  @override
  State<PerfilPet_T> createState() => _PerfilPet_TState();
}

class _PerfilPet_TState extends State<PerfilPet_T> {
  String _vac = "";
  String _saude = "";

  String saude(int s) {
    if (s == 0) {
      _saude = "Sim, possui.";
    } else {
      _saude = "Não possui.";
    }
    return _saude;
  }

  String vacinacao(int vac) {
    if (vac == 0) {
      _vac = "Possui todas as vacinas.";
    } else if (vac == 1) {
      _vac = "Possui somente vacina antirrábica.";
    } else if (vac == 2) {
      _vac = "Possui outras vacinas com exceção a antirrábica.";
    } else if (vac == 3) {
      _vac = "Não possui vacinas.";
    }
    return _vac;
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const MenuHorTutor()
                ],
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Nome",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              Text(
                "Idade",
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
                    color: Colors.blueAccent),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
              ),
            ]),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.02,
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
                            "Nome",
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
                            "Data de Nascimento",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            "12/09/2023",
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
                            "Feminino",
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
                            "12.0kg",
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
                            "Grande",
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
                            "Gato de bengala",
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
                            height: MediaQuery.of(context).size.height * 0.055,
                            child: Text(
                              vacinacao(2),
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
                            height: MediaQuery.of(context).size.height * 0.096,
                            child: Text(
                              "Possui problemas de saúde que precisem de atendimento especial ou lugar adaptado?",
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
                          Text(saude(0),
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
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Text(
                              "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  overflow: TextOverflow.ellipsis),
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ])),
                  ),
                ],
              ),
            ],
          ),
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
