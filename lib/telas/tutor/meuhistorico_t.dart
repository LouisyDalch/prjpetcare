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
  Widget _btnAndamento() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(7, 88, 20, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color.fromRGBO(7, 88, 20, 1)))),
        child: const Text(
          'Em andamento',
          style: TextStyle(
            fontSize: 19, color: Color.fromRGBO(17, 57, 2, 1)),
        ),
      ),
    );
  }

  Widget _btnConfirmados() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(7, 88, 20, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color.fromRGBO(7, 88, 20, 1)))),
        child: const Text(
          'Em andamento',
          style: TextStyle(
            fontSize: 19, color: Color.fromRGBO(0, 0, 0, 1)
            ),
        ),
      ),
    );
  }


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
             _btnAndamento()
            ],),
          ],
        )
      ]),
    );
  }
}