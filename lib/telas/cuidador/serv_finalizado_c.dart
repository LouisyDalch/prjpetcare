import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';

import '../../Elementos_design/item_final_c.dart';
import '../../Elementos_design/item_solic_c.dart';

class ServFinal_C extends StatefulWidget {
  const ServFinal_C({super.key});

  @override
  State<ServFinal_C> createState() => _ServFinal_CState();
}

class _ServFinal_CState extends State<ServFinal_C> {
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
          WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Finalizados',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontFamily: 'LilitaOne',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.75,
                      //color: Color.fromARGB(255, 124, 170, 248),
                      child: ListView.builder(
                          itemCount: lst.length,
                          itemBuilder: (context, Index) {
                            return ItemFinalC();
                          }),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01)),
                    MenuHorCuidador()
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
