import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:prjpetcare/telas/cuidador/logado_c.dart';
import 'package:prjpetcare/telas/cuidador/perfil_c.dart';

class VisualizacaoPet_T extends StatefulWidget {
  VisualizacaoPet_T({super.key});

  @override
  State<VisualizacaoPet_T> createState() => _VisualizacaoPet_TState();
}

class _VisualizacaoPet_TState extends State<VisualizacaoPet_T> {
  String ptUm = "";
  String ptDois = "";

  bool mais = true;

  int nav = 0;
  final telas = [
    VisualizacaoPet_T,
    const LogadoCuidador(),
    const Perfil_C(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: nav,
        backgroundColor: Color.fromRGBO(226, 225, 225, 1),
        fixedColor: Color.fromRGBO(219, 114, 38, 1),
        unselectedItemColor: Color.fromRGBO(117, 116, 116, 1),
        onTap: (opcao) {
          print("obs: $opcao");
          setState(() {
            nav = opcao;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded), label: "Loja"),
        ],
      ),
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
                              borderRadius: BorderRadius.circular(10)),
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
                              "Nome_pet",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                              ),
                            ),
                            Text(
                              "idade",
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
                                "12/09/2000",
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
                                "Masculino",
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
                                "Dálmata",
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
                                "100.00kg",
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
                                "pequeno",
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
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                width: MediaQuery.of(context).size.width * 0.75,
                                child: Text(
                                  "Possui outras vacinas, menos a antirrábica.",
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
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.02,
                                vertical:
                                    MediaQuery.of(context).size.height * 0.01),
                            child: ptDois.isEmpty
                                ? Text(ptUm)
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
            ],
          ),
        ],
      ),
    );
  }
}
