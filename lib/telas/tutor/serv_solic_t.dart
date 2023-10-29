import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_confirm_t.dart';

import '../../Elementos_design/Itens_lista/It_Cuidador/item_final_c.dart';
import '../../Elementos_design/Itens_lista/It_Tutor/item_solic_t.dart';

class ServSolic_T extends StatefulWidget {
  const ServSolic_T({super.key});

  @override
  State<ServSolic_T> createState() => _ServSolic_TState();
}

class _ServSolic_TState extends State<ServSolic_T> {
  final List lst = [
    'um',
    'dois',
    'três',
    'quatro',
    'cinco',
    'seis',
    'sete',
    'oito'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Solicitações',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontFamily: 'LilitaOne',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.75,
                      //color: Color.fromARGB(255, 124, 170, 248),
                      child: ListView.builder(
                          itemCount: lst.length,
                          itemBuilder: (context, Index) {
                            return const ItemSolicT();
                          }),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01)),
                    const MenuHorTutor()
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
