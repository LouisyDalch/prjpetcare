import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';

class MeuHist_T extends StatefulWidget {
  const MeuHist_T({super.key});

  @override
  State<MeuHist_T> createState() => _MeuHist_TState();
}

class _MeuHist_TState extends State<MeuHist_T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             Text("Meu Histórico",
             style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.07,
              fontFamily: "LilitaOne"
             ),),
             Container(
              height: MediaQuery.of(context).size.height * 0.08,
             ),
             Row(
               children: [
                 Text("Serviços", 
                 style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                  fontWeight: FontWeight.bold
                 ),),
                 Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                 )
               ],
             ),
             
            ],),
          ],
        )
      ]),
    );
  }
}