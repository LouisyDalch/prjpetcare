import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Cuidador/item_final_c.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Cuidador/item_pet_c.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_pet_t.dart';

class VisualTutor_C extends StatefulWidget {
  const VisualTutor_C({super.key});

  @override
  State<VisualTutor_C> createState() => _VisualTutor_CState();
}

class _VisualTutor_CState extends State<VisualTutor_C> {
  final lst = ["um", "2", "três"];
  //fundovistut
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("defora/imagens/fundovistut.png"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(height: MediaQuery.of(context).size.height * 0.1),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.brown),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.05),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Maria Eduarda Expedita Oliveira Canto",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Tantos anos",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Text(
                                "Localização",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Brooklyn, Rua das Maritacas, 603",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Formas de contato",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "(11) 97654-0988",
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "loulou@gmail.com",
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.of(context).size.width *
                                                  0.05,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                          ),
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(212, 42, 162, 24)
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.chat_sharp,
                                      color: Color.fromRGBO(28, 73, 25, 1),),
                                      iconSize:
                                          MediaQuery.of(context).size.width * 0.1,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Meus Pets",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01),
                              Icon(
                                Icons.pets_sharp,
                                size: MediaQuery.of(context).size.width * 0.06,
                              )
                            ],
                          ),
                          ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: lst.length,
                              itemBuilder: (context, Index) {
                                return const ItemPet_C();
                              }),
                        ],
                      ),
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.08),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
