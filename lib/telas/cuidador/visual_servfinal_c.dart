import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';

class VisualServFinal extends StatefulWidget {
  const VisualServFinal({super.key});

  @override
  State<VisualServFinal> createState() => _VisualServFinalState();
}

class _VisualServFinalState extends State<VisualServFinal> {
  int _rating = 0;

  void _handleRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 1; i <= 5; i++) {
      IconData starIcon = _rating >= i ? Icons.star : Icons.star_border;
      stars.add(
        GestureDetector(
          //quando c for programar, tira o gesture detector e coloca o valor ali no _rating
          onTap: () {
            _handleRating(i);
          },
          child: Icon(starIcon, color: Colors.amber, size: 40),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        "Serviço Finalizado",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.06),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(143, 153, 153, 153),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Sobre o tutor",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              )),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(219, 114, 38, 1),
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    child: Text(
                                      "Maria Eduarda Expedita Oliveira Canto",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text("Idade")),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text("Localização")),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: GestureDetector(
                                        onTap: () => Navigator.of(context)
                                            .pushNamed('/visualizacao_tutor_c'),
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  219, 114, 38, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Text(
                                    "Sobre o pet",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                ],
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(219, 114, 38, 1),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text(
                                        "Nome",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text("Idade")),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed('/visualizacao_pet_c'),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.47,
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  219, 114, 38, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.004,
                            width: MediaQuery.of(context).size.width * 0.85,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Modalidade: Creche",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Início: 14/12/2024 às 14:30",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Término: 14/12/2024 às 15:00",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.004,
                            width: MediaQuery.of(context).size.width * 0.85,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Feedback",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              )),
                              Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: stars,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05,
                                        color: Colors.black.withOpacity(0.5)),
                              )),
                              Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
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
              MenuHorCuidador()
            ],
          )
        ],
      ),
    );
  }
}
